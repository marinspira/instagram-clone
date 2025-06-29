import Foundation

struct UserModel: Identifiable {
    let id: UUID = UUID()
    let username: String
    let profileImageName: String
    let bio: String
}
