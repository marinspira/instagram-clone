# Momogram – Instagram Clone using SwiftUI & MVVM

Momogram is a simplified Instagram clone built with **SwiftUI** following the **MVVM** architecture pattern. The app simulates core UI features of Instagram, such as a scrollable post feed, user profile, and image posting. All data is locally mocked for UI and state management demonstration.

---

## Features

- Feed screen displaying mocked posts with user info, image, and caption
- Profile screen with user stats, bio, and grid of images
- Reusable UI components (`PostView`, `UserStat`)
- Navigation using `NavigationStack`
- MVVM separation for scalability and clarity

---

## Architecture Overview

Momogram/

├── Models/ // Data models: Post, UserModel

├── ViewModels/ // View logic: FeedViewModel

├── Views/ // UI: Feed, Profile, Post, NewPost

├── Resources/ // Static image assets

├── MockData.swift // Mocked user, post, and follower data

└── ContentView.swift // Entry point with navigation

![App Screenshot](momogram/Screenshots/image.png)

## License

This project is intended for educational and prototyping purposes only. It is not affiliated with or endorsed by Instagram.
