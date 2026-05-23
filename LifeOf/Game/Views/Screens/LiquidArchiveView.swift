import SwiftUI

struct LiquidArchiveView: View {
    let fragments: [MemoryFragment]
    let unlockedFragments: Set<String>

    @State private var selectedFragment: MemoryFragment?

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                Text("回忆碎片")
                    .font(LiquidFonts.narrative(size: 34, weight: .bold))
                    .foregroundStyle(LiquidPalette.textPrimary)
                    .padding(.horizontal, 24)
                    .padding(.top, 60)

                Text("这些不是线索，是你们一点点靠近时留下的生活证据。")
                    .font(LiquidFonts.ui(size: 15))
                    .foregroundStyle(LiquidPalette.textSecondary)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)

                LazyVStack(spacing: 24) {
                    ForEach(fragments) { fragment in
                        let isUnlocked = unlockedFragments.contains(fragment.id)
                        LiquidFragmentCard(fragment: fragment, isUnlocked: isUnlocked) {
                            if isUnlocked {
                                selectedFragment = fragment
                            }
                        }
                        .scrollTransition { content, phase in
                            content
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.9)
                                .opacity(phase.isIdentity ? 1.0 : 0.6)
                                .rotation3DEffect(
                                    .degrees(phase.value * -15),
                                    axis: (x: 1, y: 0, z: 0)
                                )
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 140)
            }
        }
        .sheet(item: $selectedFragment) { fragment in
            LiquidFragmentDetail(fragment: fragment)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
                .presentationBackground(.ultraThinMaterial)
        }
    }
}

private struct LiquidFragmentCard: View {
    let fragment: MemoryFragment
    let isUnlocked: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 20) {
                ZStack {
                    Circle()
                        .fill(isUnlocked ? LiquidPalette.boundaries.opacity(0.2) : Color.white.opacity(0.05))
                        .frame(width: 64, height: 64)

                    Image(systemName: isUnlocked ? fragment.icon : "lock.fill")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(isUnlocked ? LiquidPalette.boundaries : LiquidPalette.textSecondary.opacity(0.5))
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text(isUnlocked ? fragment.name : "未知碎片")
                        .font(LiquidFonts.narrative(size: 20, weight: .bold))
                        .foregroundStyle(isUnlocked ? LiquidPalette.textPrimary : LiquidPalette.textSecondary.opacity(0.5))
                        .blur(radius: isUnlocked ? 0 : 3)

                    if isUnlocked {
                        Text("\(fragment.date) · \(fragment.location)")
                            .font(LiquidFonts.ui(size: 12, weight: .medium))
                            .foregroundStyle(LiquidPalette.textSecondary)
                    } else {
                        Text("随故事进展解锁")
                            .font(LiquidFonts.ui(size: 12, weight: .medium))
                            .foregroundStyle(LiquidPalette.textSecondary.opacity(0.5))
                    }
                }
                Spacer()
            }
            .padding(20)
            .liquidGlass(cornerRadius: 24)
        }
        .buttonStyle(LiquidButtonStyle())
        .disabled(!isUnlocked)
    }
}

private struct LiquidFragmentDetail: View {
    let fragment: MemoryFragment
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            LiquidPalette.surface.opacity(0.5).ignoresSafeArea()

            VStack(spacing: 30) {
                Image(systemName: fragment.icon)
                    .font(.system(size: 50, weight: .light))
                    .foregroundStyle(LiquidPalette.boundaries)
                    .padding(30)
                    .background(LiquidPalette.boundaries.opacity(0.15), in: Circle())
                    .padding(.top, 40)

                Text(fragment.name)
                    .font(LiquidFonts.narrative(size: 32, weight: .bold))
                    .foregroundStyle(LiquidPalette.textPrimary)

                HStack(spacing: 16) {
                    Label(fragment.date, systemImage: "calendar")
                    Label(fragment.location, systemImage: "mappin.circle")
                }
                .font(LiquidFonts.ui(size: 14, weight: .semibold))
                .foregroundStyle(LiquidPalette.textSecondary)

                Text(fragment.description)
                    .font(LiquidFonts.narrative(size: 18))
                    .lineSpacing(8)
                    .foregroundStyle(LiquidPalette.textPrimary.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)

                Spacer()

                Button("收起碎片") {
                    dismiss()
                }
                .font(LiquidFonts.ui(size: 16, weight: .bold))
                .foregroundStyle(LiquidPalette.background)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background(LiquidPalette.textPrimary, in: Capsule())
                .padding(.horizontal, 40)
                .padding(.bottom, 40)
            }
        }
    }
}
