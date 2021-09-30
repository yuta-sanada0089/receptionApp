import SwiftUI

struct UserCardView: View {
    let user: User
    
    var body: some View {
        NavigationLink(destination: VisitorView(user: user, buttonType: .searchByName), label: {
            HStack(spacing: 8.0) {
                Image(uiImage: user.profile.displayImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 88, height: 88)
                    .background(Color.dark12)
                    .cornerRadius(44)
                VStack(alignment: .leading, spacing: 8.0) {
                    if let title = user.profile.title {
                        Text(title)
                            .font(.defaultFont(ofSize: 14))
                            .padding(4)
                            .background(Color.dark12)
                    }
                    Text(user.realName)
                        .font(.defaultFont(ofSize: 24))
                    Text(user.profile.displayName ?? "")
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
        })
        .buttonStyle(PlainButtonStyle())
    }
}
