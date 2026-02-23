import SwiftUI

extension Color {
    static let backgroundLightYellow = Color(hex: "#FFF6D5")
    static let cardSandYellow = Color(hex: "#FFE8A8")
    static let infoCream = Color(hex: "#FFF1C2")
    static let buttonYellow = Color(hex: "#FFB800")
    static let buttonHighlight = Color(hex: "#FFE58F")
    static let accentOrange = Color(hex: "#FF7A00")
    static let dangerRed = Color(hex: "#FF2E00")
    static let textDarkBrown = Color(hex: "#3A2400")
    static let textSoftBrown = Color(hex: "#6B4A12")
    static let lowRiskGreen = Color(hex: "#3FDA52")
    static let mediumRiskOrange = Color(hex: "#FF7A00")
    static let highRiskRed = Color(hex: "#FF2E00")
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
            (a, r, g, b) = (1, 1, 1, 0)
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
