import SwiftUI

struct VisitorView: View {
    let user: User?
    @ObservedObject private var viewModel = VisitorViewModel()
    
    var body: some View {
        Text("お客様の会社名／お名前をご入力ください")
            .font(.defaultFont(ofSize: 32))
            .padding(16)
        HStack {
            Text("会社名")
                .font(.defaultFont(ofSize: 24))
                .padding(.horizontal, 24)
            TextField("会社名を入力", text: $viewModel.companyName)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(PlainTextFieldStyle())
                .multilineTextAlignment(TextAlignment.center)
                .font(.defaultFont(ofSize: 24))
                .padding(.vertical, 16)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(1)
                .background(textFieldBorder(colors: [Color.green2]))
        }
        .frame(width: 930)
        .padding(4)
        .background(Color.dark12)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .compositingGroup()
        HStack {
            Text("お名前")
                .font(.defaultFont(ofSize: 24))
                .padding(.horizontal, 24)
            TextField("お名前を入力", text: $viewModel.visitorName)
                .textFieldStyle(PlainTextFieldStyle())
                .multilineTextAlignment(TextAlignment.center)
                .font(.defaultFont(ofSize: 24))
                .padding(.vertical, 16)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(1)
                .background(textFieldBorder(colors: [Color.red]))
        }
        .frame(width: 930)
        .padding(4)
        .background(Color.dark12)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .compositingGroup()
        HStack {
            HStack {
                Text("追加ゲスト")
                    .multilineTextAlignment(.center)
                    .font(.defaultFont(ofSize: 24))
                    .padding(.horizontal, 36)
                VStack {
                    Text("\(viewModel.guestCount)")
                        .multilineTextAlignment(.center)
                        .font(.defaultBoldFont(ofSize: 48))
                        .padding(.top, 12)
                    Rectangle()
                        .foregroundColor(.borderColor)
                        .frame(width: 100, height: 1)
                }
                VStack {
                    Button(action: { viewModel.guestCount += 1 }, label: {
                        Text("+")
                            .frame(width: 36, height: 36, alignment: .center)
                            .foregroundColor(.primaryTextColor)
                            .font(.defaultFont(ofSize: 36))
                            .padding(.bottom, 5)
                    })
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
                    Button(
                        action: {
                            guard viewModel.guestCount > 0 else { return }
                            viewModel.guestCount -= 1
                        },
                        label: {
                            Text("-")
                                .frame(width: 36, height: 36, alignment: .center)
                                .foregroundColor(.primaryTextColor)
                                .font(.defaultFont(ofSize: 36))
                                .padding(.bottom, 2)
                        }
                    )
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
                }
            }
            .frame(width: 455, height: 135)
            .border(Color.black, width: 1)
            Button(
                action: { viewModel.onTapButton() },
                label: {
                    Text(user != nil ? (user?.realName)! + "の呼び出し" : "呼び出し")
                        .frame(width: 455, height: 135, alignment: .center)
                        .font(.defaultFont(ofSize: 24))
                        .foregroundColor(.linkTextColor)
                        .border(Color.linkTextColor, width: 1)
                }
            )
            .alert(isPresented: $viewModel.isAlertActive, content: {
                Alert(title: Text("お名前をご入力ください"), message: nil, dismissButton: .default(Text("はい")))
            })
        }
        .frame(width: 930)
        .compositingGroup()
        NavigationLink(
            destination: CompletionView(user: user),
            isActive: $viewModel.isPushActive,
            label: {}
        )
        .hideNavigationBar()
        .edgesIgnoringSafeArea(.all)
    }
}
