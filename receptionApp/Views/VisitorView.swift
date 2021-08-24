import SwiftUI

struct VisitorView: View {
    let user: User?
    var body: some View {
        Text("Visitor View")
    }
}

struct VisitorView_Previews: PreviewProvider {
    static var previews: some View {
        VisitorView(user: nil)
    }
}
