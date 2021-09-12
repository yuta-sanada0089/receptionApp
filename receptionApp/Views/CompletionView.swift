import SwiftUI

struct CompletionView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationLink(destination: ContentView(), label: {
            Text("next view")
        })
        Button("画面を閉じる") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct CompletionView_Previews: PreviewProvider {
    static var previews: some View {
        CompletionView()
    }
}
