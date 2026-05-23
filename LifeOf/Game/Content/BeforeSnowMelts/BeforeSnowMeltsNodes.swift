import Foundation

enum BeforeSnowMeltsNodes {
    static let startNodeID = "chapter_open"

    static let all: [String: StoryNode] = {
        var merged: [String: StoryNode] = [:]
        [prologue, firstMessage, firstMeet, susongTrip, mountainAndReturn, endings].forEach { chunk in
            merged.merge(chunk) { _, new in new }
        }
        return merged
    }()
}
