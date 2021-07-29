import SwiftUI

struct ReceptionView: View {
    private var columns: [GridItem] = Array(repeating: .init(.flexible(maximum: 364), spacing: CGFloat(10.0) ), count: 3)
    var body: some View {
        LazyVGrid(columns: columns, alignment: .center, spacing: 10, content: {
            ForEach((1...5), id: \.self) {num in
                ReceptionButtonView(title: "担当者で探す方はこちら", subTitle: "interview")
            }
        })
    }
}

struct ReceptionButtonView: View {
    var title: String
    var subTitle: String
    var body: some View {
        VStack {
            Text(title)
                .font(.defaultFont(ofSize: 24))
            Divider()
                .padding(.horizontal, 16)
                .background(Color.borderColor)
            Text(subTitle)
                .padding(8)
                .font(.defaultFont(ofSize: 14))
            Rectangle()
                .foregroundColor(.linkTextColor)
                .frame(height: 3)
        }
        .frame(height: 163)
        .border(Color.borderColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ReceptionView_Previews: PreviewProvider {
    static var previews: some View {
        ReceptionView()
    }
}
