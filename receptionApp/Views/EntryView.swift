import SwiftUI

struct EntryView: View {
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

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView()
    }
}
