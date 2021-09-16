import SwiftUI

struct ContentView: View {
    @State var isActive: Bool = false
    @EnvironmentObject var envData: EnvironmentViewModel
    var body: some View {
        NavigationView {
            ZStack {
                Image("default_back_image")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                    .fill(Color.light54)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("default_logo")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 500, maxHeight: 450)
                        .padding(20)
                    NavigationLink(destination: ReceptionView(), isActive: $isActive, label: {})
                    Button("ご用の方は画面をタップしてください") {
                        isActive = true
                        envData.isNavigationActive = $isActive
                    }
                    .frame(width: 565, height: 68, alignment: .center)
                    .foregroundColor(.primaryTextColor)
                    .background(Color.light100)
                    .font(.custom("HiraginoSans-W3", size: 24))
                    .cornerRadius(34.0)
                    .compositingGroup()
                    .shadow(color: .dark26, radius: 4, x: 0, y: 0)
                }
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
