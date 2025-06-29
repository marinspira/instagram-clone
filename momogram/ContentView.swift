import SwiftUI
import PhotosUI

struct ContentView: View {
    @StateObject private var viewModel = FeedViewModel()
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
    @State private var showNewPostView = false
    @State private var showProfileView = false
    
    @State private var currentUser = UserModel(
        username: "maria",
        profileImageName: "grid2",
        bio: ""
    )
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Top Bar
                HStack {
                    Text("Instagram")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        Image(systemName: "plus.app")
                        Image(systemName: "heart")
                        Image(systemName: "paperplane")
                    }
                    .font(.title2)
                }
                .padding()
                
                Divider()
                
                // Feed
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(viewModel.posts) { post in
                            PostView(post: post)
                        }
                    }
                }
                
                Divider()
                
                // Bottom Navigation
                HStack(spacing: 40) {
                    Image(systemName: "house.fill")
                    Image(systemName: "magnifyingglass")
                    
                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        Image(systemName: "plus.app")
                    }
                    .onChange(of: selectedItem) { oldValue, newValue in
                        Task {
                            if let data = try? await newValue?.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: data) {
                                selectedImage = uiImage
                                showNewPostView = true
                            }
                        }
                    }
                    
                    Image(systemName: "play.rectangle")
                    Image(systemName: "person.circle")
                        .onTapGesture {
                            showProfileView = true
                        }
                }
                .font(.title2)
                .padding(.vertical, 10)
            }
            // Navegação para Nova Postagem
            .navigationDestination(isPresented: $showNewPostView) {
                if let selectedImage {
                    NewPostView(image: selectedImage)
                }
            }
            .navigationDestination(isPresented: $showProfileView) {
                ProfileView(user: currentUser)
            }
        }
    }
}

#Preview {
    ContentView()
}
