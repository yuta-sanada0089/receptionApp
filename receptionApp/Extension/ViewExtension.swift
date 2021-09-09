import SwiftUI

extension View {
    func hideNavigationBar() -> some View {
        modifier(HideNavigationBarModifier())
    }
    
    func textFieldBorder(colors: [Color]) -> some View {
        return RoundedRectangle(cornerRadius: 10)
            .strokeBorder(
                LinearGradient(
                    gradient: .init(colors: colors),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: 1
            )
    }
}
