import SwiftUI

extension Color {
    static var buttonTitleColor: Color { create(light: .light100, dark: .light100) }
    static var buttonBackgroundColor: Color { create(light: .green1, dark: .green1) }
    static var disabledButtonBackgroundColor: Color { create(light: .dark26, dark: .light54) }

    static var baseColor: Color { create(light: .altLightGray, dark: .altDarkGray) }
    static var baseColor2: Color { create(light: .light100, dark: .dark87) }
    static var subColor: Color { create(light: .altLightGray2, dark: .altDarkGray2) }
    static var primaryTextColor: Color { create(light: .dark87, dark: .light100) }
    static var secondaryTextColor: Color { create(light: .dark26, dark: .light54) }
    static var tertiaryTextColor: Color { create(light: .dark56, dark: light54) }
    static var alertTextColor: Color { create(light: .red, dark: .red) }
    static var linkTextColor: Color { create(light: .blue, dark: .blue) }

    static var borderColor: Color { create(light: .dark12, dark: .light12) }
    static var shadowColor: Color { Color(red: 0, green: 0, blue: 0, opacity: 0.5) }
    static var dimColor: Color { Color(red: 0, green: 0, blue: 0, opacity: 0.26) }

    private static func create(light: Color, dark: Color) -> Color {
        return UITraitCollection.current.userInterfaceStyle == .dark ? dark : light
    }
}

extension Color {
    static var dark87: Color { Color(red: 33 / 255.0, green: 33 / 255.0, blue: 33 / 255.0, opacity: 1) }
    static var dark56: Color { Color(red: 112 / 255.0, green: 112 / 255.0, blue: 112 / 255.0, opacity: 1) }
    static var dark26: Color { Color(red: 194 / 255.0, green: 194 / 255.0, blue: 194 / 255.0, opacity: 1) }
    static var dark12: Color { Color(red: 224 / 255.0, green: 224 / 255.0, blue: 224 / 255.0, opacity: 1) }

    static var light100: Color { Color(red: 255 / 255.0, green: 255 / 255.0, blue: 255 / 255.0, opacity: 1) }
    static var light54: Color { Color(red: 255 / 255.0, green: 255 / 255.0, blue: 255 / 255.0, opacity: 0.54) }
    static var light30: Color { Color(red: 255 / 255.0, green: 255 / 255.0, blue: 255 / 255.0, opacity: 0.30) }
    static var light12: Color { Color(red: 255 / 255.0, green: 255 / 255.0, blue: 255 / 255.0, opacity: 0.12) }

    static var accentGreen: Color { Color(red: 214 / 255.0, green: 241 / 255.0, blue: 238 / 255.0, opacity: 1) }
    static var accentRed: Color { Color(red: 255 / 255.0, green: 229 / 255.0, blue: 232 / 255.0, opacity: 1) }
    static var accentYellow: Color { Color(red: 255 / 255.0, green: 246 / 255.0, blue: 226 / 255.0, opacity: 1) }

    static var altDarkGray: Color { Color(red: 58 / 255.0, green: 58 / 255.0, blue: 58 / 255.0, opacity: 1) }
    static var altDarkGray2: Color { Color(red: 40 / 255.0, green: 40 / 255.0, blue: 40 / 255.0, opacity: 1) }
    static var altLightGray: Color { Color(red: 237 / 255.0, green: 237 / 255.0, blue: 237 / 255.0, opacity: 1) }
    static var altLightGray2: Color { Color(red: 247 / 255.0, green: 247 / 255.0, blue: 247 / 255.0, opacity: 1) }

    static var green1: Color { Color(red: 3 / 255.0, green: 170 / 255.0, blue: 148 / 255.0, opacity: 1) }
    static var green2: Color { Color(red: 103 / 255.0, green: 218 / 255.0, blue: 49 / 255.0, opacity: 1) }
    static var blue: Color { Color(red: 3 / 255.0, green: 127 / 255.0, blue: 255 / 255.0, opacity: 1) }
    static var red: Color { Color(red: 222 / 255.0, green: 60 / 255.0, blue: 75 / 255.0, opacity: 1) }
}
