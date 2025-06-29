import SwiftUI

struct PostView: View {
    
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            // Post Header
            HStack {
                Image(post.user.profileImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text(post.user.username)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding()
            
            // Post Image
            Image(post.imageName)
                .resizable()
                .scaledToFill()
            
            // Post Actions
            HStack(spacing: 20) {
                Image(systemName: "heart")
                Image(systemName: "paperplane")
                Spacer()
                Image(systemName: "bookmark")
            }
            .font(.title3)
            .padding(.horizontal)
            .padding(.top, 5)
            
            // Likes
            Text("Liked by user1 and others")
                .font(.subheadline)
                .padding(.horizontal)
                .padding(.vertical, 5)
            
            HStack {
                Text(post.user.username)
                    .font(.subheadline)
                    .bold()
                
                Text(post.caption)
                    .font(.subheadline)
            }
            .padding(.horizontal)
        
            
        }
    }
}
