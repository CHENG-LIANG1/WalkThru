import SwiftUI
#if canImport(UIKit)
import UIKit // Added for Haptics
#endif

// Haptic Feedback Helper
struct LiquidHaptics {
    enum Style {
        case light, medium, heavy
    }

    static func play(style: Style = .light) {
        #if canImport(UIKit)
        let uiStyle: UIImpactFeedbackGenerator.FeedbackStyle
        switch style {
        case .light: uiStyle = .light
        case .medium: uiStyle = .medium
        case .heavy: uiStyle = .heavy
        }
        let generator = UIImpactFeedbackGenerator(style: uiStyle)
        generator.prepare()
        generator.impactOccurred()
        #endif
    }
}

struct LiquidPalette {
    static let background = Color(hex: "#090A0E")
    static let surface = Color(hex: "#161821")
    static let textPrimary = Color(hex: "#F4F5F8")
    static let textSecondary = Color(hex: "#8A8D98")

    static let sincerity = Color(hex: "#FF8C61") // Warm Orange
    static let ease = Color(hex: "#6EE7B7")      // Mint
    static let boundaries = Color(hex: "#7FA1FF")// Glacier Blue

    static let glassLight = Color.white.opacity(0.12)
    static let glassEdge = Color.white.opacity(0.25)
}

struct LiquidFonts {
    static func narrative(size: CGFloat = 19, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .serif)
    }
    static func ui(size: CGFloat = 14, weight: Font.Weight = .medium) -> Font {
        .system(size: size, weight: weight, design: .rounded)
    }
}

// Background that shifts based on temperature
struct LiquidBackground: View {
    let temperature: RelationshipTemperature

    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let now = timeline.date.timeIntervalSinceReferenceDate
                let angle = now * 0.3

                context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(LiquidPalette.background))

                let cx = size.width / 2
                let cy = size.height / 2

                // Sincerity Orb
                let sinWeight = max(0.4, Double(temperature.sincerity) / 100.0)
                let r1 = size.width * 0.6 * sinWeight
                let p1 = CGPoint(x: cx + cos(angle) * 80, y: cy + sin(angle * 1.2) * 90)
                context.addFilter(.blur(radius: 60))
                context.fill(Path(ellipseIn: CGRect(x: p1.x - r1, y: p1.y - r1, width: r1*2, height: r1*2)), with: .color(LiquidPalette.sincerity.opacity(0.35)))

                // Ease Orb
                let easeWeight = max(0.4, Double(temperature.ease) / 100.0)
                let r2 = size.width * 0.7 * easeWeight
                let p2 = CGPoint(x: cx + sin(angle * 0.7) * 110, y: cy + cos(angle * 0.9) * 100)
                context.fill(Path(ellipseIn: CGRect(x: p2.x - r2, y: p2.y - r2, width: r2*2, height: r2*2)), with: .color(LiquidPalette.ease.opacity(0.25)))

                // Boundaries Orb
                let boundWeight = max(0.4, Double(temperature.boundaries) / 100.0)
                let r3 = size.width * 0.8 * boundWeight
                let p3 = CGPoint(x: cx + cos(angle * 1.4) * 60, y: cy + sin(angle * 0.8) * 130)
                context.fill(Path(ellipseIn: CGRect(x: p3.x - r3, y: p3.y - r3, width: r3*2, height: r3*2)), with: .color(LiquidPalette.boundaries.opacity(0.25)))
            }
        }
        .ignoresSafeArea()
        .overlay(Color.black.opacity(0.15).ignoresSafeArea()) // subtle dimming
    }
}

// Glass Modifier
struct LiquidGlass: ViewModifier {
    var cornerRadius: CGFloat = 24

    func body(content: Content) -> some View {
        content
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .background(LiquidPalette.glassLight, in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(LinearGradient(colors: [LiquidPalette.glassEdge, .clear, LiquidPalette.glassEdge.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
            )
            .shadow(color: Color.black.opacity(0.3), radius: 25, x: 0, y: 15)
    }
}

extension View {
    func liquidGlass(cornerRadius: CGFloat = 24) -> some View {
        modifier(LiquidGlass(cornerRadius: cornerRadius))
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
