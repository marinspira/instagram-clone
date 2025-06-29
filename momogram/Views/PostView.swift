import SwiftUI

struct PostView: View {
    
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            // Post Header
            HStack {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 40, height: 40)
                Text(post.user.username)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding()
            
            // Post Image
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .aspectRatio(1, contentMode: .fit)
            
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
                    .padding(.horizontal)
                    .bold()
                
                Text(post.caption)
                    .font(.subheadline)
            }
        
            
        }
    }
}
