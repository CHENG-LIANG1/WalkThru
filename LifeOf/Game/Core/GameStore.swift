import Foundation
import SwiftUI
import Combine

private enum ArchiveStorageKeys {
    static let storageVersion = "before_snow_storage_version"
    static let currentNodeID = "before_snow_current_node_id"
    static let unlockedFragments = "before_snow_unlocked_fragments"
    static let unlockedEndings = "before_snow_unlocked_endings"
    static let relationshipTemperature = "before_snow_relationship_temperature"
    static let playCount = "before_snow_play_count"
}

private let currentStorageVersion = "chapter1_relationship_v1"

@MainActor
final class GameStore: ObservableObject {
    let catalog: StoryCatalog

    @Published private(set) var currentNodeID: String
    @Published private(set) var unlockedFragments: Set<String>
    @Published private(set) var unlockedEndings: Set<String>
    @Published private(set) var relationshipTemperature: RelationshipTemperature
    @Published private(set) var playCount: Int
    @Published private(set) var currentCGName: String? // 追踪当前的背景图

    private let defaults: UserDefaults

    init(catalog: StoryCatalog? = nil, defaults: UserDefaults = .standard) {
        let resolvedCatalog = catalog ?? .beforeSnowMelts
        self.catalog = resolvedCatalog
        self.defaults = defaults

        if defaults.string(forKey: ArchiveStorageKeys.storageVersion) != currentStorageVersion {
            defaults.removeObject(forKey: ArchiveStorageKeys.currentNodeID)
            defaults.removeObject(forKey: ArchiveStorageKeys.unlockedFragments)
            defaults.removeObject(forKey: ArchiveStorageKeys.unlockedEndings)
            defaults.removeObject(forKey: ArchiveStorageKeys.relationshipTemperature)
            defaults.set(currentStorageVersion, forKey: ArchiveStorageKeys.storageVersion)
        }

        self.currentNodeID = defaults.string(forKey: ArchiveStorageKeys.currentNodeID) ?? resolvedCatalog.startNodeID
        self.unlockedFragments = Self.decodeSet(defaults.string(forKey: ArchiveStorageKeys.unlockedFragments) ?? "")
        self.unlockedEndings = Self.decodeSet(defaults.string(forKey: ArchiveStorageKeys.unlockedEndings) ?? "")
        self.relationshipTemperature = Self.decodeTemperature(
            defaults.string(forKey: ArchiveStorageKeys.relationshipTemperature) ?? ""
        )

        let savedPlayCount = defaults.integer(forKey: ArchiveStorageKeys.playCount)
        self.playCount = savedPlayCount == 0 ? 1 : savedPlayCount

        repairStateIfNeeded()
        applyNodeSideEffects(currentNode)

        // Initialize current CG
        if let initialNode = self.catalog.node(for: self.currentNodeID) {
            self.currentCGName = initialNode.imageName
        }
    }

    var currentNode: StoryNode {
        catalog.node(for: currentNodeID) ?? catalog.startNode
    }

    func navigate(to nodeID: String) {
        guard let targetNode = catalog.node(for: nodeID) else { return }
        currentNodeID = targetNode.id

        // CG Persistence Logic: If next node has an image, update it. If it's an empty string, clear it. Otherwise, keep the old one.
        if let newCG = targetNode.imageName {
            if newCG.isEmpty {
                currentCGName = nil
            } else {
                currentCGName = newCG
            }
        }

        persistCurrentNodeID()
        applyNodeSideEffects(targetNode)
    }

    func navigate(with choice: StoryChoice) {
        relationshipTemperature = relationshipTemperature.applying(choice.effects)
        persistTemperature()
        navigate(to: choice.destinationID)
    }

    func restartFromIntro() {
        currentNodeID = catalog.startNodeID
        persistCurrentNodeID()
        applyNodeSideEffects(catalog.startNode)
    }

    func openEndingsAfterTerminalNode() {
        restartFromIntro()
    }

    func resetAllData() {
        currentNodeID = catalog.startNodeID
        unlockedFragments = []
        unlockedEndings = []
        relationshipTemperature = .initial

        playCount += 1

        persistCurrentNodeID()
        persistFragments()
        persistEndings()
        persistTemperature()
        defaults.set(playCount, forKey: ArchiveStorageKeys.playCount)
        defaults.set(currentStorageVersion, forKey: ArchiveStorageKeys.storageVersion)

        applyNodeSideEffects(catalog.startNode)
    }

    private func repairStateIfNeeded() {
        guard catalog.node(for: currentNodeID) != nil else {
            currentNodeID = catalog.startNodeID
            persistCurrentNodeID()
            return
        }
    }

    private func applyNodeSideEffects(_ node: StoryNode) {
        unlockFragment(node.fragmentIDToUnlock)
        unlockEnding(node.endingIDToTrigger)
    }

    private func unlockFragment(_ id: String?) {
        guard let id else { return }
        guard unlockedFragments.insert(id).inserted else { return }
        persistFragments()
    }

    private func unlockEnding(_ id: String?) {
        guard let id else { return }
        guard unlockedEndings.insert(id).inserted else { return }
        persistEndings()
    }

    private func persistCurrentNodeID() {
        defaults.set(currentNodeID, forKey: ArchiveStorageKeys.currentNodeID)
    }

    private func persistFragments() {
        defaults.set(Self.encodeSet(unlockedFragments), forKey: ArchiveStorageKeys.unlockedFragments)
    }

    private func persistEndings() {
        defaults.set(Self.encodeSet(unlockedEndings), forKey: ArchiveStorageKeys.unlockedEndings)
    }

    private func persistTemperature() {
        defaults.set(Self.encodeTemperature(relationshipTemperature), forKey: ArchiveStorageKeys.relationshipTemperature)
    }

    private static func encodeSet(_ values: Set<String>) -> String {
        values.sorted().joined(separator: "|")
    }

    private static func decodeSet(_ rawValue: String) -> Set<String> {
        Set(rawValue.split(separator: "|").map(String.init))
    }

    private static func encodeTemperature(_ temperature: RelationshipTemperature) -> String {
        [temperature.sincerity, temperature.ease, temperature.boundaries]
            .map(String.init)
            .joined(separator: "|")
    }

    private static func decodeTemperature(_ rawValue: String) -> RelationshipTemperature {
        let values = rawValue.split(separator: "|").compactMap { Int($0) }
        guard values.count == 3 else { return .initial }
        return RelationshipTemperature(sincerity: values[0], ease: values[1], boundaries: values[2])
    }
}
