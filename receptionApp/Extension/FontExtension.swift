import SwiftUI

extension Font {
    static func defaultFont(ofSize size: CGFloat) -> Font {
        return .custom("HiraginoSans-W3", size: size)
    }

    static func defaultBoldFont(ofSize size: CGFloat) -> Font {
        return .custom("HiraginoSans-W6", size: size)
    }
}
