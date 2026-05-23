import Foundation

extension StoryCatalog {
    static let beforeSnowMelts = StoryCatalog(
        startNodeID: BeforeSnowMeltsNodes.startNodeID,
        nodes: BeforeSnowMeltsNodes.all,
        fragments: BeforeSnowMeltsFragments.all,
        endings: BeforeSnowMeltsEndings.all
    )
}
