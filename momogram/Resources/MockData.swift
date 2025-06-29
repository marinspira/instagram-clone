import Foundation

struct MockData {
    
    static let users: [UserModel] = [
        UserModel(
            username: "maria",
            profileImageName: "grid",
            bio: "Sofrware developer",
        ),
        UserModel(
            username: "joao_dev",
            profileImageName: "grid1",
            bio: "",
        ),
        UserModel(
            username: "ana_123",
            profileImageName: "grid2",
            bio: "",
        )
    ]
    
    static let currentUser: UserModel = users[0]

    // feed posts
    static let posts: [Post] = [
        Post(user: users[0], imageName: "grid1", caption: "With my babe", likes: 120),
        Post(user: users[0], imageName: "grid", caption: "Code. Sleep. Repeat.", likes: 88),
        Post(user: users[0], imageName: "grid2", caption: "Dias incríveis 🌞", likes: 240)
    ]
    
    // profile grid
    static let profileImages: [String] = [
        "grid1", "grid", "grid2"
    ]
    
    // followers
    static let followers: [UserModel] = [
        users[1], users[2]
    ]
    
    static let following: [UserModel] = [
        users[1]
    ]
}
