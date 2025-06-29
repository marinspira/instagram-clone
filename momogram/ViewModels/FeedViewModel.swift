import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        loadPosts()
    }
    
    func loadPosts() {
        posts = MockData.posts
    }
}
