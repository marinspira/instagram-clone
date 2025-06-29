import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        loadPosts()
    }
    
    func loadPosts() {
        let maria = UserModel(
            username: "maria",
            profileImageName: "grid",
            bio: "",
        )
        let joao = UserModel(
            username: "joao_dev",
            profileImageName: "grid1",
            bio: "",
        )
        let ana = UserModel(
            username: "ana_123",
            profileImageName: "grid2",
            bio: "",
        )
        
        posts = [
            Post(user: maria, imageName: "photo1", caption: "Amo esse lugar!", likes: 120),
            Post(user: joao, imageName: "photo2", caption: "Code. Sleep. Repeat.", likes: 88),
            Post(user: ana, imageName: "photo3", caption: "Dias incríveis 🌞", likes: 240)
        ]
    }
}
