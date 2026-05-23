import SwiftUI
import Combine
#if canImport(UIKit)
import UIKit
#endif

// Helper to force device orientation
class OrientationManager: ObservableObject {
    static let shared = OrientationManager()

    #if canImport(UIKit)
    func forceOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: orientation))
        }
    }
    #else
    func forceOrientation(_ orientation: Int) {
        // Fallback for macOS
    }
    #endif
}

struct GameRootView: View {
    @StateObject private var store = GameStore()
    @State private var selectedTab: GameTab = .chapters
    @StateObject private var orientationManager = OrientationManager.shared

    var body: some View {
        ZStack {
            LiquidBackground(temperature: store.relationshipTemperature)

            if selectedTab == .reader {
                LiquidReaderView(
                    node: store.currentNode,
                    currentCGName: store.currentCGName,
                    relationshipTemperature: store.relationshipTemperature,
                    onChoose: { choice in
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                            store.navigate(with: choice)
                        }
                    },
                    onOpenEndings: {
                        withAnimation(.spring()) {
                            store.openEndingsAfterTerminalNode()
                            selectedTab = .endings
                        }
                    },
                    onExit: {
                        withAnimation {
                            selectedTab = .chapters
                        }
                    }
                )
                .onAppear {
                    #if canImport(UIKit)
                    orientationManager.forceOrientation(.landscape)
                    #endif
                }
                .onDisappear {
                    #if canImport(UIKit)
                    orientationManager.forceOrientation(.portrait)
                    #endif
                }
            } else {
                TabView(selection: $selectedTab) {
                    LiquidChaptersView(
                        selectedTab: $selectedTab,
                        playCount: store.playCount,
                        onReset: {
                            store.resetAllData()
                        }
                    )
                    .tabItem {
                        Label("篇章", systemImage: "book.pages")
                    }
                    .tag(GameTab.chapters)

                    LiquidArchiveView(
                        fragments: store.catalog.fragments,
                        unlockedFragments: store.unlockedFragments
                    )
                    .tabItem {
                        Label("碎片", systemImage: "sparkles")
                    }
                    .tag(GameTab.archive)

                    LiquidEndingsView(
                        endings: store.catalog.endings,
                        unlockedEndings: store.unlockedEndings
                    )
                    .tabItem {
                        Label("分支", systemImage: "point.3.connected.trianglepath.dotted")
                    }
                    .tag(GameTab.endings)
                }
            }
        }
        .preferredColorScheme(.dark)
        .tint(LiquidPalette.sincerity)
    }
}
