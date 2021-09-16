import SwiftUI

struct CompletionView: View {
    @State private var count = 10
    @EnvironmentObject var envData: EnvironmentViewModel
    let user: User?

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("呼び出し完了")
                .font(.defaultFont(ofSize: 28))
                .padding()
            iconImageView(user: user)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .background(Color.dark12)
                .cornerRadius(100)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.linkTextColor, lineWidth: 10)
                )
                .padding()
            Text("呼び出しが完了しました。しばらくお待ちください。\n間もなく担当者が参ります。")
                .multilineTextAlignment(.center)
                .padding()
            Text("\(count)秒後にTOPに戻ります。")
        }
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                count -= 1
                if count == 0 {
                    timer.invalidate()
                    envData.isNavigationActive.wrappedValue = false
                }
            }
        }
        .hideNavigationBar()
    }
    
    private func iconImageView(user: User?) -> Image {
        guard let user = user else { return Image("ic_icon") }
        return Image(uiImage: user.profile.displayImage)
    }
}
