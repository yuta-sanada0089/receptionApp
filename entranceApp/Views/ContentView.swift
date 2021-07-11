import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("LOGO")
                    .frame(width: 200, height: 200, alignment: .center)
                    .foregroundColor(.primary)
                    .font(.custom("HiraginoSans-W6", size: 64))
                    .padding(150)
                NavigationLink(destination: ReceptionView(), label: {
                    ZStack(alignment: .center, content: {
                        Text("受付へ進む")
                            .frame(width: 200, height: 50)
                            .foregroundColor(.white)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing)
                            )
                            .font(.custom("HiraginoSans-W3", size: 24))
                            .cornerRadius(5.0)
                            .shadow(color: .black, radius: 5.0, x: 1.0, y: 1.0)
                    })
                })
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                NavigationLink(destination: SettingView(), label: {
                    Image("ic-setting")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                })
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.device)
            .previewDevice("iPad Pro (11-inch) (2nd generation)")
    }
}
