import SwiftUI

struct ProfileView: View {
    let user: UserModel
    let images = MockData.profileImages
    let followers = MockData.followers
    
    @Environment(\.dismiss) private var dismiss
    
    // Grid for photos
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Photo and followers
                HStack(spacing: 16) {
                    Image(user.profileImageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                    
                    Spacer()
                    
                    HStack(spacing: 24) {
                        userStat(count: 42, label: "Posts")
                        userStat(count: 1200, label: "Seguidores")
                        userStat(count: 180, label: "Seguindo")
                    }
                    Spacer()
                }
                .padding(.horizontal)
                
                // Name and bio
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.username)
                        .font(.title2)
                        .bold()
                    
                    Text(user.bio)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                // Edit profile button
                Button {
                } label: {
                    Text("Editar Perfil")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                    
                }
                .padding(.horizontal)
                
                // Posts grid
                LazyVGrid(columns: columns, spacing: 2) {
                    ForEach(MockData.profileImages, id: \.self) { postName in
                        Image(postName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width/3 - 4, height: UIScreen.main.bounds.width/3 - 4)
                            .clipped()
                    }
                }
                .padding(.horizontal, 2)
            }
            .padding(.top)
        }
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.primary)
                }
            }
        }
    }
    
    // Static components
    func userStat(count: Int, label: String) -> some View {
        VStack {
            Text("\(count)")
                .font(.headline)
                .bold()
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(width: 60)
    }
}
