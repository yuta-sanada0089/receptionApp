import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel = SearchViewModel()
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
                    ForEach(viewModel.members, id: \.id) { user in
                        UserCardView(user: user)
                    }
                })
                .padding(.leading, 125)
                .padding(.trailing, 125)
            }
        }
    }
}
