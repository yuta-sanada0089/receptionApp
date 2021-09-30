import SwiftUI

struct ReceptionView: View {
    private var receptionButtons = receptionButtonData
    private var columns: [GridItem] = Array(repeating: .init(.flexible(maximum: 364), spacing: CGFloat(30.0) ), count: 2)
    var body: some View {
        VStack {
            Spacer().frame(height: 70)
            Image("default_logo")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 730, maxHeight: 190)
            Spacer()
                .frame(height: 16)
            Text("ご来訪いただきありがとうございます。\n以下のボタンより入館手続きをお願いします")
                .frame(height: 64)
                .font(.defaultFont(ofSize: 18))
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: 16)
            LazyVGrid(columns: columns, alignment: .center, spacing: 30, content: {
                ForEach(receptionButtons, id: \.buttonType) { receptionButton in
                    NavigationLink(destination: nextView(receptionButton: receptionButton), label: {
                        ReceptionButtonView(receptionButton: receptionButton)
                    })
                }
            })
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private func nextView(receptionButton: ReceptionButton) -> AnyView {
        switch receptionButton.buttonType {
        case .searchByName: return AnyView(SearchView())
        case .general: return AnyView(VisitorView(viewModel: .init(user: nil, buttonType: .general)))
        case .interview: return AnyView(VisitorView(viewModel: .init(user: nil, buttonType: .interview)))
        case .delivery:
            return AnyView(
                ReceptionConfirmView(viewModel: .init(buttonType: .delivery, user: nil))
            )
        }
    }
}

struct ReceptionButtonView: View {
    var receptionButton: ReceptionButton
    var body: some View {
        VStack {
            Text(receptionButton.buttonType.title())
                .font(.defaultFont(ofSize: 24))
                .foregroundColor(.primaryTextColor)
                .padding(8)
            Divider()
                .background(Color.borderColor)
            Text(receptionButton.buttonType.subTitle())
                .font(.defaultFont(ofSize: 14))
                .foregroundColor(.primaryTextColor)
                .padding(8)
            Rectangle()
                .foregroundColor(.green1)
                .frame(height: 3)
        }
        .padding(.horizontal, 30)
        .frame(height: 162)
        .background(Color.light100)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .compositingGroup()
        .shadow(color: .dark26, radius: 4, x: 0, y: 0)
    }
}
