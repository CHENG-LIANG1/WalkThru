import SwiftUI

struct LiquidEndingsView: View {
    let endings: [GameEnding]
    let unlockedEndings: Set<String>

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                Text("故事分支")
                    .font(LiquidFonts.narrative(size: 34, weight: .bold))
                    .foregroundStyle(LiquidPalette.textPrimary)
                    .padding(.horizontal, 24)
                    .padding(.top, 60)

                Text("不同选择会留下不同口吻的结尾，但每一条都温柔地往前走。")
                    .font(LiquidFonts.ui(size: 15))
                    .foregroundStyle(LiquidPalette.textSecondary)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)

                LazyVStack(spacing: 32) {
                    ForEach(endings) { ending in
                        let isUnlocked = unlockedEndings.contains(ending.id)
                        LiquidEndingCard(ending: ending, isUnlocked: isUnlocked)
                            .scrollTransition { content, phase in
                                content
                                    .scaleEffect(phase.isIdentity ? 1.0 : 0.85)
                                    .opacity(phase.isIdentity ? 1.0 : 0.3)
                            }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 140)
            }
        }
    }
}

private struct LiquidEndingCard: View {
    let ending: GameEnding
    let isUnlocked: Bool

    private var accent: Color {
        ending.isTrueEnding ? LiquidPalette.sincerity : LiquidPalette.ease
    }

    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            ZStack {
                Circle()
                    .fill(isUnlocked ? accent.opacity(0.2) : Color.white.opacity(0.05))
                    .frame(width: 56, height: 56)

                Image(systemName: isUnlocked ? ending.icon : "questionmark")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(isUnlocked ? accent : LiquidPalette.textSecondary.opacity(0.5))
            }
            .padding(.top, 4)

            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(isUnlocked ? ending.name : "未知的收束")
                        .font(LiquidFonts.narrative(size: 22, weight: .bold))
                        .foregroundStyle(isUnlocked ? LiquidPalette.textPrimary : LiquidPalette.textSecondary.opacity(0.5))
                        .blur(radius: isUnlocked ? 0 : 2)

                    if isUnlocked && ending.isTrueEnding {
                        Text("TRUE")
                            .font(LiquidFonts.ui(size: 10, weight: .black))
                            .foregroundStyle(accent)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 3)
                            .background(accent.opacity(0.2), in: Capsule())
                    }
                }

                if isUnlocked {
                    Text(ending.description)
                        .font(LiquidFonts.narrative(size: 16))
                        .lineSpacing(6)
                        .foregroundStyle(LiquidPalette.textPrimary.opacity(0.8))
                } else {
                    Text("继续故事，做出不同选择，就会看到这一章的另一种可能。")
                        .font(LiquidFonts.narrative(size: 16))
                        .lineSpacing(6)
                        .foregroundStyle(LiquidPalette.textSecondary.opacity(0.4))
                }
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .liquidGlass(cornerRadius: 28)
        .overlay(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .stroke(isUnlocked ? accent.opacity(0.3) : .clear, lineWidth: 1)
        )
    }
}
