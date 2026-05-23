import SwiftUI

struct LiquidChaptersView: View {
    @Binding var selectedTab: GameTab
    let playCount: Int
    let onReset: () -> Void

    @State private var showingResetAlert = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 40) {
                // Title & Stats
                VStack(spacing: 16) {
                    Text("故事篇章")
                        .font(LiquidFonts.narrative(size: 32, weight: .bold))
                        .foregroundStyle(LiquidPalette.textPrimary)

                    HStack(spacing: 24) {
                        StatView(title: "游玩次数", value: "\(playCount)")
                    }
                    .padding(.top, 4)
                }
                .padding(.top, 24)

                // Chapters
                VStack(spacing: 24) {
                    ChapterCard(
                        number: "01",
                        title: "融雪之前",
                        description: "从 N5 展板到宿松雨夜，一条由聊天记录、离谱行动和正确时间组成的世界线。",
                        isLocked: false
                    ) {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                            selectedTab = .reader
                        }
                    }

                    ChapterCard(
                        number: "02",
                        title: "未知篇章",
                        description: "更多故事仍在酝酿中...",
                        isLocked: true
                    ) {}
                }
                .padding(.horizontal, 24)

                // Reset Button
                Button(action: {
                    LiquidHaptics.play(style: .medium)
                    showingResetAlert = true
                }) {
                    HStack {
                        Image(systemName: "arrow.counterclockwise")
                        Text("重置剧情")
                    }
                    .font(LiquidFonts.ui(size: 14, weight: .bold))
                    .foregroundStyle(LiquidPalette.boundaries)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(LiquidPalette.boundaries.opacity(0.1), in: Capsule())
                    .overlay(Capsule().stroke(LiquidPalette.boundaries.opacity(0.3), lineWidth: 1))
                }
                .padding(.top, 20)
            }
            .padding(.bottom, 40)
        }
        .alert("确定重置一切吗？", isPresented: $showingResetAlert) {
            Button("先保留", role: .cancel) {}
            Button("从头开始", role: .destructive) {
                withAnimation {
                    onReset()
                }
            }
        } message: {
            Text("所有的回忆和温度都会消散，故事将从第一章的开头重新来过。")
        }
    }
}

private struct StatView: View {
    let title: String
    let value: String

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(LiquidFonts.ui(size: 18, weight: .bold))
                .foregroundStyle(LiquidPalette.sincerity)
            Text(title)
                .font(LiquidFonts.ui(size: 12, weight: .medium))
                .foregroundStyle(LiquidPalette.textSecondary)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(LiquidPalette.glassEdge, lineWidth: 1))
    }
}

private struct ChapterCard: View {
    let number: String
    let title: String
    let description: String
    let isLocked: Bool
    let action: () -> Void

    var body: some View {
        Button(action: {
            if !isLocked {
                LiquidHaptics.play(style: .medium)
                action()
            }
        }) {
            HStack(spacing: 20) {
                // Chapter Number
                Text(number)
                    .font(LiquidFonts.ui(size: 48, weight: .black))
                    .foregroundStyle(isLocked ? LiquidPalette.textSecondary.opacity(0.3) : LiquidPalette.sincerity.opacity(0.8))
                    .frame(width: 80, alignment: .leading)

                // Chapter Details
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(LiquidFonts.narrative(size: 22, weight: .bold))
                        .foregroundStyle(isLocked ? LiquidPalette.textSecondary : LiquidPalette.textPrimary)

                    Text(description)
                        .font(LiquidFonts.ui(size: 13, weight: .regular))
                        .lineSpacing(4)
                        .foregroundStyle(LiquidPalette.textSecondary)
                        .multilineTextAlignment(.leading)
                }

                Spacer(minLength: 0)

                if isLocked {
                    Image(systemName: "lock.fill")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(LiquidPalette.textSecondary.opacity(0.5))
                } else {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(LiquidPalette.sincerity)
                }
            }
            .padding(24)
            .frame(maxWidth: .infinity)
            .liquidGlass(cornerRadius: 24)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(isLocked ? Color.clear : LiquidPalette.glassEdge, lineWidth: 1)
            )
            .opacity(isLocked ? 0.6 : 1.0)
        }
        .buttonStyle(LiquidChapterButtonStyle(isLocked: isLocked))
        .disabled(isLocked)
    }
}

struct LiquidChapterButtonStyle: ButtonStyle {
    let isLocked: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed && !isLocked ? 0.95 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}
