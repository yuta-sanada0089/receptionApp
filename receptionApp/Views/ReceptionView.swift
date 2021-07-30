import SwiftUI

struct ReceptionView: View {
    private var columns: [GridItem] = Array(repeating: .init(.flexible(maximum: 364), spacing: CGFloat(10.0) ), count: 3)
    var body: some View {
        VStack {
            Spacer().frame(height: 70)
            Image("default_logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 730, maxHeight: 190)
            Spacer()
                .frame(height: 16)
            Text("ご来訪いただきありがとうございます。\n以下のボタンより入館手続きをお願いします")
                .frame(height: 64)
                .font(.defaultFont(ofSize: 18))
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: 16)
            LazyVGrid(columns: columns, alignment: .center, spacing: 10, content: {
                ForEach((1...5), id: \.self) {num in
                    ReceptionButtonView(title: "担当者で探す方はこちら", subTitle: "interview")
                }
            })
            Spacer()
        }
        .hideNavigationBar()
        .edgesIgnoringSafeArea(.all)
    }
}

struct ReceptionButtonView: View {
    var title: String
    var subTitle: String
    var body: some View {
        VStack {
            Text(title)
                .font(.defaultFont(ofSize: 24))
                .padding(8)
            Divider()
                .background(Color.borderColor)
            Text(subTitle)
                .font(.defaultFont(ofSize: 14))
                .padding(8)
            Rectangle()
                .foregroundColor(.linkTextColor)
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

struct ReceptionView_Previews: PreviewProvider {
    static var previews: some View {
        ReceptionView()
    }
}
