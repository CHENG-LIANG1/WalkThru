import Foundation

struct StoryNode: Identifiable, Codable, Equatable {
    let id: String
    let title: String
    let text: String // 兼容旧数据的段落文本
    let dialogues: [DialogueLine]? // 纯对话格式
    let choices: [StoryChoice]
    let fragmentIDToUnlock: String?
    let endingIDToTrigger: String?
    let imageName: String?

    // 核心改造：自动将旧的 text 转换为 DialogueLine，让整个游戏瞬间全部变为 AVG 对话框模式
    var displayDialogues: [DialogueLine] {
        if let d = dialogues, !d.isEmpty {
            return d
        }
        let lines = text.components(separatedBy: "\n\n")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
        return lines.map { DialogueLine(speaker: nil, content: $0) }
    }

    init(id: String, title: String, text: String = "", dialogues: [DialogueLine]? = nil, choices: [StoryChoice], fragmentIDToUnlock: String? = nil, endingIDToTrigger: String? = nil, imageName: String? = nil) {
        self.id = id
        self.title = title
        self.text = text
        self.dialogues = dialogues
        self.choices = choices
        self.fragmentIDToUnlock = fragmentIDToUnlock
        self.endingIDToTrigger = endingIDToTrigger
        self.imageName = imageName
    }
}

enum TextEffect: String, Codable, Equatable {
    case normal, shake, glitch, bloodRed, huge
}

struct DialogueLine: Identifiable, Codable, Equatable {
    var id: String = UUID().uuidString
    let speaker: String?
    let content: String
    let effect: TextEffect

    init(id: String = UUID().uuidString, speaker: String? = nil, content: String, effect: TextEffect = .normal) {
        self.id = id
        self.speaker = speaker
        self.content = content
        self.effect = effect
    }
}

struct RelationshipEffects: Codable, Hashable, Equatable {
    let sincerity: Int
    let ease: Int
    let boundaries: Int

    static let none = RelationshipEffects()

    init(sincerity: Int = 0, ease: Int = 0, boundaries: Int = 0) {
        self.sincerity = sincerity
        self.ease = ease
        self.boundaries = boundaries
    }
}

struct RelationshipTemperature: Codable, Hashable, Equatable {
    let sincerity: Int
    let ease: Int
    let boundaries: Int

    static let initial = RelationshipTemperature(sincerity: 0, ease: 0, boundaries: 0)

    func applying(_ effects: RelationshipEffects) -> RelationshipTemperature {
        RelationshipTemperature(
            sincerity: Self.clamp(sincerity + effects.sincerity),
            ease: Self.clamp(ease + effects.ease),
            boundaries: Self.clamp(boundaries + effects.boundaries)
        )
    }

    private static func clamp(_ value: Int) -> Int {
        min(max(value, 0), 100)
    }
}

struct StoryChoice: Identifiable, Codable, Hashable {
    // For v1, choice text is unique within the script and serves as a stable id.
    var id: String { text }

    let text: String
    let destinationID: String
    let isGlitch: Bool
    let effects: RelationshipEffects

    init(
        text: String,
        destinationID: String,
        isGlitch: Bool = false,
        effects: RelationshipEffects = .none
    ) {
        self.text = text
        self.destinationID = destinationID
        self.isGlitch = isGlitch
        self.effects = effects
    }
}

struct MemoryFragment: Identifiable, Hashable {
    let id: String
    let name: String
    let date: String
    let location: String
    let description: String
    let icon: String
}

struct GameEnding: Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
    let isTrueEnding: Bool
    let isAbsurd: Bool
    let icon: String
}
