import SwiftUI

struct NewPostView: View {
    let image: UIImage

    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .cornerRadius(12)
                .padding()

            Text("Write a caption...")

            Spacer()
        }
        .navigationTitle("New Post")
        .navigationBarTitleDisplayMode(.inline)
    }
}

