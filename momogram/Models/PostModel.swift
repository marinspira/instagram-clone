import Foundation

struct Post: Identifiable {
    let id: UUID = UUID()
    let user: UserModel
    let imageName: String
    let caption: String
    let likes: Int
}
