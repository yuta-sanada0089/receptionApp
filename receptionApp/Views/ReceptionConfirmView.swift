import SwiftUI

struct ReceptionConfirmView: View {
    @ObservedObject var viewModel: ReceptionConfirmViewModel
    
    var body: some View {
        VStack {
            Image("ic_reception")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 360, maxHeight: 150)
                .padding(.bottom, 50)
            if let user = viewModel.user {
                Text(viewModel.visitorName.isEmpty ? "ご来社ありがとうございます。" : "\(viewModel.visitorName)様、ご来社ありがとうございます")
                    .font(.defaultFont(ofSize: 18))
                    .padding(.bottom, 50)
                UserCardView(user: user)
                    .padding(.bottom, 50)
                Text("こちらの担当者を呼び出します。よろしいでしょうか？")
                    .multilineTextAlignment(.center)
                    .font(.defaultFont(ofSize: 18))
                    .padding(.bottom, 50)
            } else {
                Text(viewModel.visitorName.isEmpty ? "ご来社ありがとうございます。" : "\(viewModel.visitorName)様、ご来社ありがとうございます")
                    .font(.defaultFont(ofSize: 18))
                    .padding(.bottom, 50)
                Text("入力した内容で受付します。\nよろしいでしょうか？")
                    .multilineTextAlignment(.center)
                    .font(.defaultFont(ofSize: 24))
                    .padding(.bottom, 50)
            }
            Button(
                action: {
                    viewModel.postSlack()
                },
                label: {
                    Text("OK")
                        .frame(width: 455, height: 135, alignment: .center)
                        .font(.defaultFont(ofSize: 24))
                        .foregroundColor(.linkTextColor)
                        .border(Color.linkTextColor, width: 1)
                }
            )
            NavigationLink(
                destination: CompletionView(user: viewModel.user),
                isActive: $viewModel.isPushActive,
                label: {}
            )
        }
    }
}
