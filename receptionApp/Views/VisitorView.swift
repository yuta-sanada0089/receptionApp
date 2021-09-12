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
            TextField("性", text: $viewModel.firstName)
                .textFieldStyle(PlainTextFieldStyle())
                .multilineTextAlignment(TextAlignment.center)
                .font(.defaultFont(ofSize: 24))
                .padding(.vertical, 16)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(1)
                .background(textFieldBorder(colors: [Color.red]))
            TextField("名", text: $viewModel.lastName)
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
        Button(
            action: { viewModel.onTapButton() },
            label: {
                Text("呼び出す")
                    .frame(width: 455, height: 135, alignment: .center)
                    .font(.defaultFont(ofSize: 24))
                    .foregroundColor(.linkTextColor)
                    .border(Color.linkTextColor, width: 1)
            }
        )
        .alert(isPresented: $viewModel.isAlertActive, content: {
            Alert(title: Text("お名前はフルネームでご入力ください"), message: nil, dismissButton: .default(Text("はい")))
        })
        NavigationLink(
            destination: CompletionView(),
            isActive: $viewModel.isPushActive,
            label: {}
        )
        .hideNavigationBar()
        .edgesIgnoringSafeArea(.all)
    }
}

struct VisitorView_Previews: PreviewProvider {
    static var previews: some View {
        VisitorView(user: nil)
    }
}
