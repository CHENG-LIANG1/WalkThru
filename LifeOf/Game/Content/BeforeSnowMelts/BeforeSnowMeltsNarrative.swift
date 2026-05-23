import Foundation

enum BeforeSnowMeltsNarrative {
    static func block(_ paragraphs: String...) -> String {
        paragraphs
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: "\n\n")
    }
}
