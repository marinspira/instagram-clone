import SwiftUI
import PhotosUI

struct ContentView: View {
    @StateObject private var viewModel = FeedViewModel()
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
    @State private var showNewPostView = false
    @State private var showProfileView = false
    
    let user = MockData.currentUser
    let images = MockData.profileImages
    let followers = MockData.followers

    
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
                        ForEach(MockData.posts) { post in
                            PostView(post: post)
                        }
                    }
                }
                
                Divider()
                
                HStack {
                    Button {
                    } label: {
                        Image(systemName: "house.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                    }
                    .frame(maxWidth: .infinity)

                    Button {
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                    }
                    .frame(maxWidth: .infinity)

                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        Image(systemName: "plus.app")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
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
                    .frame(maxWidth: .infinity)

                    Button {
                        // ação reels
                    } label: {
                        Image(systemName: "play.rectangle")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                    }
                    .frame(maxWidth: .infinity)

                    Button {
                        showProfileView = true
                    } label: {
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .foregroundColor(.primary)

                
            }
            // Navegação para Nova Postagem
            .navigationDestination(isPresented: $showNewPostView) {
                if let selectedImage {
                    NewPostView(image: selectedImage)
                }
            }
            .navigationDestination(isPresented: $showProfileView) {
                ProfileView(user: user)
            }
        }
    }
}

#Preview {
    ContentView()
}
