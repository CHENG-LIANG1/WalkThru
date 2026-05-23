import SwiftUI

struct LiquidReaderView: View {
    let node: StoryNode
    let currentCGName: String? // Persistent CG from GameStore
    let relationshipTemperature: RelationshipTemperature
    let onChoose: (StoryChoice) -> Void
    let onOpenEndings: () -> Void
    let onExit: () -> Void // Exit reading mode

    @State private var currentDialogueIndex: Int = 0
    @State private var isCurrentDialogueFullyRevealed: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {
            // Base Background
            Color.black.ignoresSafeArea()

            // Header & Center Image
            VStack {
                HStack {
                    Button(action: onExit) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.4), in: Circle())
                    }
                    Spacer()
                    LiquidReaderHeader(node: node, context: LiquidStoryContext.context(for: node.id), temperature: relationshipTemperature)
                        .padding(.horizontal)
                }
                .padding(.top, 16)

                Spacer()

                // Persistent CG Image
                if let imageName = currentCGName {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 200) // Constrain height in landscape
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(color: .black.opacity(0.6), radius: 10, x: 0, y: 5)
                        .padding(.bottom, 120) // Reserve space for the dialogue box
                        .transition(.opacity)
                }

                Spacer()
            }
            .ignoresSafeArea(edges: .bottom)

            // AVG Style Bottom Dialogue Box
            let dialoguesToDisplay = node.displayDialogues
            if !dialoguesToDisplay.isEmpty {
                if currentDialogueIndex < dialoguesToDisplay.count {
                    LiquidAVGDialogueBox(
                        line: dialoguesToDisplay[currentDialogueIndex],
                        isFullyRevealed: $isCurrentDialogueFullyRevealed,
                        onRevealComplete: {
                            isCurrentDialogueFullyRevealed = true
                        }
                    )
                    .padding(.horizontal, 40)
                    .padding(.bottom, 32)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                } else {
                    // Full Screen Choices Overlay
                    ZStack {
                        Color.black.opacity(0.85).ignoresSafeArea()
                        VStack(spacing: 32) {
                            Text("抉择")
                                .font(LiquidFonts.narrative(size: 24, weight: .bold))
                                .foregroundStyle(LiquidPalette.sincerity)
                                .tracking(4)

                            LiquidChoicePanel(node: node, onChoose: onChoose, onOpenEndings: onOpenEndings)
                                .frame(maxWidth: 600)
                        }
                    }
                    .transition(.opacity)
                    .zIndex(2)
                }
            } else {
                // Choices for nodes with no dialogues at all
                ZStack {
                    Color.black.opacity(0.85).ignoresSafeArea()
                    VStack(spacing: 32) {
                        Text("抉择")
                            .font(LiquidFonts.narrative(size: 24, weight: .bold))
                            .foregroundStyle(LiquidPalette.sincerity)
                            .tracking(4)

                        LiquidChoicePanel(node: node, onChoose: onChoose, onOpenEndings: onOpenEndings)
                            .frame(maxWidth: 600)
                    }
                }
                .transition(.opacity)
                .zIndex(2)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            advanceDialogue(dialoguesCount: node.displayDialogues.count)
        }
        .onChange(of: node.id) { _ in
            currentDialogueIndex = 0
            isCurrentDialogueFullyRevealed = false
        }
        #if canImport(UIKit)
        .navigationBarHidden(true)
        #endif
    }

    private func advanceDialogue(dialoguesCount: Int) {
        if isCurrentDialogueFullyRevealed {
            if currentDialogueIndex < dialoguesCount - 1 {
                currentDialogueIndex += 1
                isCurrentDialogueFullyRevealed = false
            } else {
                currentDialogueIndex = dialoguesCount
            }
        } else {
            isCurrentDialogueFullyRevealed = true
        }
    }
}

private struct LiquidReaderHeader: View {
    let node: StoryNode
    let context: LiquidStoryContext
    let temperature: RelationshipTemperature

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(context.chapter)
                        .font(LiquidFonts.ui(size: 11, weight: .bold))
                        .tracking(1.5)
                        .foregroundStyle(LiquidPalette.sincerity)

                    Text(node.title)
                        .font(LiquidFonts.narrative(size: 22, weight: .bold))
                        .foregroundStyle(.white)
                }
                Spacer()

                // Temperature indicators
                HStack(spacing: 4) {
                    Circle().fill(LiquidPalette.sincerity).frame(width: 6, height: 6).opacity(temperature.sincerity > 0 ? 1 : 0.2)
                    Circle().fill(LiquidPalette.ease).frame(width: 6, height: 6).opacity(temperature.ease > 0 ? 1 : 0.2)
                    Circle().fill(LiquidPalette.boundaries).frame(width: 6, height: 6).opacity(temperature.boundaries > 0 ? 1 : 0.2)
                }
            }

            HStack(spacing: 12) {
                Label(context.date, systemImage: "clock")
                Label(context.place, systemImage: "mappin.circle")
            }
            .font(LiquidFonts.ui(size: 10, weight: .semibold))
            .foregroundStyle(Color.white.opacity(0.7))
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .background(
            Color.black.opacity(0.4)
                .cornerRadius(12)
        )
    }
}

private struct LiquidNarrativeText: View {
    let text: String
    let nodeID: String
    var onRevealComplete: (() -> Void)? = nil

    @State private var visibleParagraphs = 0

    private var paragraphs: [String] {
        text.components(separatedBy: "\n\n")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(Array(paragraphs.enumerated()), id: \.offset) { index, paragraph in
                Text(paragraph)
                    .font(LiquidFonts.narrative(size: 19))
                    .lineSpacing(8)
                    .tracking(0.5)
                    .foregroundStyle(LiquidPalette.textPrimary.opacity(0.92))
                    .opacity(index < visibleParagraphs ? 1 : 0)
                    .offset(y: index < visibleParagraphs ? 0 : 15)
                    .blur(radius: index < visibleParagraphs ? 0 : 10)
                    .animation(.spring(response: 0.8, dampingFraction: 0.8).delay(Double(index) * 0.25), value: visibleParagraphs)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .onAppear(perform: triggerReveal)
        .onChange(of: nodeID) { _ in triggerReveal() }
    }

    private func triggerReveal() {
        visibleParagraphs = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            visibleParagraphs = paragraphs.count

            // Notify completion after the last paragraph animation finishes
            let totalDelay = Double(paragraphs.count - 1) * 0.25 + 0.8
            DispatchQueue.main.asyncAfter(deadline: .now() + totalDelay) {
                onRevealComplete?()
            }
        }
    }
}

private struct LiquidImageView: View {
    let imageName: String
    @State private var isVisible = false
    @State private var imageExists = true

    var body: some View {
        if imageExists {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 240)
                .clipped()
                .liquidGlass(cornerRadius: 24)
                .opacity(isVisible ? 1 : 0)
                .offset(y: isVisible ? 0 : 20)
                .blur(radius: isVisible ? 0 : 15)
                .onAppear {
                    if let UIImageClass = NSClassFromString("UIImage") as? NSObject.Type {
                        if UIImageClass.responds(to: NSSelectorFromString("imageNamed:")) {
                            // Assuming UIImage exists (iOS/Mac Catalyst)
                        } else {
                            imageExists = false
                        }
                    } else {
                        // Assuming NSImage exists (macOS)
                        if NSClassFromString("NSImage") == nil {
                            imageExists = false
                        }
                    }

                    if imageExists {
                        withAnimation(.spring(response: 0.8, dampingFraction: 0.8)) {
                            isVisible = true
                        }
                    }
                }
                .onChange(of: imageName) { newName in
                    // Simple check for macOS/iOS cross-platform
                    imageExists = true
                    isVisible = false
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.8).delay(0.1)) {
                        isVisible = true
                    }
                }
        }
    }
}

private struct LiquidChoicePanel: View {
    let node: StoryNode
    let onChoose: (StoryChoice) -> Void
    let onOpenEndings: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            if node.choices.isEmpty {
                Button(action: onOpenEndings) {
                    HStack {
                        Image(systemName: "infinity")
                        Text("进入分支图景")
                    }
                    .font(LiquidFonts.ui(size: 16, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .foregroundStyle(LiquidPalette.background)
                    .background(LiquidPalette.textPrimary, in: Capsule())
                    .shadow(color: LiquidPalette.textPrimary.opacity(0.3), radius: 15, x: 0, y: 8)
                }
                .buttonStyle(LiquidButtonStyle())
            } else {
                ForEach(node.choices) { choice in
                    LiquidChoiceButton(choice: choice) {
                        onChoose(choice)
                    }
                }
            }
        }
    }
}

private struct LiquidChoiceButton: View {
    let choice: StoryChoice
    let action: () -> Void

    var body: some View {
        Button {
            LiquidHaptics.play(style: .medium)
            action()
        } label: {
            HStack(spacing: 12) {
                Text(choice.text)
                    .font(LiquidFonts.narrative(size: 15, weight: .bold))
                    .foregroundStyle(LiquidPalette.textPrimary)
                    .lineSpacing(4)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)

                Spacer(minLength: 0)
                Image(systemName: "arrow.right")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(LiquidPalette.textSecondary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .liquidGlass(cornerRadius: 20)
        }
        .buttonStyle(LiquidButtonStyle())
    }
}

struct LiquidButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}


private struct LiquidAVGDialogueBox: View {
    let line: DialogueLine
    @Binding var isFullyRevealed: Bool
    let onRevealComplete: () -> Void

    private var speakerAccent: Color {
        switch line.speaker {
        case "我":
            return LiquidPalette.sincerity
        case "皖竹":
            return LiquidPalette.ease
        case "旁白":
            return LiquidPalette.boundaries
        default:
            return LiquidPalette.textSecondary
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let speaker = line.speaker {
                Text(speaker)
                    .font(LiquidFonts.ui(size: 15, weight: .black))
                    .foregroundStyle(LiquidPalette.background)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(speakerAccent, in: Capsule())
                    .offset(x: -4, y: -20) // Pop out of the box
                    .padding(.bottom, -24)
                    .zIndex(1)
            }

            VStack(alignment: .leading) {
                Text(line.content)
                    .font(line.effect == .huge ? LiquidFonts.narrative(size: 26) : LiquidFonts.narrative(size: 18))
                    .foregroundStyle(line.effect == .bloodRed ? .red : LiquidPalette.textPrimary.opacity(0.92))
                    .lineSpacing(6)
                    .tracking(0.5)
                    .modifier(ShakeEffect(animatableData: line.effect == .shake ? 1 : 0))
                    .frame(maxWidth: .infinity, minHeight: 80, alignment: .topLeading)

                // Blinking cursor indicator when fully revealed
                if isFullyRevealed {
                    Image(systemName: "arrowtriangle.down.fill")
                        .font(.system(size: 10))
                        .foregroundStyle(speakerAccent)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .opacity(isFullyRevealed ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: isFullyRevealed)
                }
            }
            .padding(20)
            .liquidGlass(cornerRadius: 16)
        }
        .onAppear {
            revealImmediately()
        }
        .onChange(of: line.id) { _ in
            revealImmediately()
        }
    }

    private func revealImmediately() {
        DispatchQueue.main.async {
            isFullyRevealed = true
            onRevealComplete()
        }
    }
}

struct ShakeEffect: GeometryEffect {
    var amount: CGFloat = 5
    var shakesPerUnit = 4
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        let translation = amount * sin(animatableData * .pi * CGFloat(shakesPerUnit))
        return ProjectionTransform(CGAffineTransform(translationX: translation, y: 0))
    }
}

private struct LiquidStoryContext {
    let chapter: String
    let date: String
    let place: String

    static func context(for nodeID: String) -> LiquidStoryContext {
        switch nodeID {
        case "chapter_open":
            return LiquidStoryContext(chapter: "第一章 / 01", date: "5 月之前", place: "N5 楼下")
        case "qingming_dm", "may25_confess", "dm_game_friend", "dm_overread", "boundary_first_wait", "worknight_messages":
            return LiquidStoryContext(chapter: "第一章 / 02", date: "2024.04 - 05", place: "聊天框与园区")
        case "may28_meet", "meet_review_slow", "skate_teach_branch":
            return LiquidStoryContext(chapter: "第一章 / 03", date: "2024.05.28", place: "N4/N5 连接处")
        case "morning_cookie", "ps_disc", "cookie_boundary_branch", "small_gesture_branch", "disc_only_branch", "ask_before_susong":
            return LiquidStoryContext(chapter: "第一章 / 04", date: "端午之前", place: "聊天框与南门")
        case "susong_prep", "daylight_susong", "invited_susong":
            return LiquidStoryContext(chapter: "第一章 / 04", date: "2024.06.07", place: "出发前夜")
        case "susong_trip", "no_question_night", "ask_too_much_night":
            return LiquidStoryContext(chapter: "第一章 / 05", date: "宿松 Day 1", place: "宿松旧街")
        case "sunday_night", "service_area_pause", "slow_after_return":
            return LiquidStoryContext(chapter: "第一章 / 06", date: "宿松 Day 2 - 3", place: "小孤山与返宁路")
        case "monday_subway", "wednesday_kiss", "ask_hand_branch", "no_holding_hand_branch", "real_slow_after_kiss", "reset_cute_branch":
            return LiquidStoryContext(chapter: "第一章 / 07", date: "返宁之后", place: "地铁与老门东")
        case "branch_gallery":
            return LiquidStoryContext(chapter: "第一章 / 分支", date: "差一点", place: "世界线回声")
        case let id where id.hasPrefix("ending_"):
            return LiquidStoryContext(chapter: "第一章 / 结局", date: "另一种后来", place: "南京")
        default:
            return LiquidStoryContext(chapter: "第一章 / 终章", date: "后来", place: "南京")
        }
    }
}
