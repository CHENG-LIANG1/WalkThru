import Foundation

struct StoryCatalog {
    let startNodeID: String
    let nodes: [String: StoryNode]
    let fragments: [MemoryFragment]
    let endings: [GameEnding]

    var startNode: StoryNode {
        nodes[startNodeID]!
    }

    func node(for id: String) -> StoryNode? {
        nodes[id]
    }
}
