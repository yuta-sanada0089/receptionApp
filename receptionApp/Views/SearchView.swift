import SwiftUI

struct SearchView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("担当者を選択")
                    .frame(height: 36)
                    .foregroundColor(.tertiaryTextColor)
                    .font(.defaultFont(ofSize: 36))
                Spacer()
                    .frame(height: 16)
                Rectangle()
                    .foregroundColor(.secondaryTextColor)
                    .frame(width: 350, height: 3)
                Spacer()
                    .frame(height: 48)
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 10.0, content: {
                    ForEach(0..<30) { index in
                        HStack(spacing: 8.0) {
                            Image("ic_person")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 88, height: 88)
                                .background(Color.dark12)
                                .cornerRadius(44)
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text("エンジニア")
                                    .font(.defaultFont(ofSize: 14))
                                    .padding(4)
                                    .background(Color.dark12)
                                Text("真田　雄太")
                                    .font(.defaultFont(ofSize: 24))
                                Text("さなだ　ゆうた")
                                    .font(.defaultFont(ofSize: 14))
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 10)
                        .frame(width: 308, height: 133)
                        .background(Color.light100)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .compositingGroup()
                        .shadow(color: .dark26, radius: 4, x: 0, y: 0)
                    }
                }).padding(.trailing)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
