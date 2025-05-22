# 🗞️ News App

**Mobile News Reader** built with Flutter.

The News App is a beautifully designed mobile application that allows users to explore, read, and save the latest news articles from around the world. Whether you’re interested in technology, business, sports, or breaking headlines — this app offers a smooth and elegant experience.

---

## ✨ Features

- **📰 Real-time News Feed**  
  Browse the latest news across various categories using live data from a reliable news API (e.g., [NewsAPI.org](https://newsapi.org)).

- **📄 Detailed Articles**  
  Read full article previews with headlines, images, publication date, and source attribution.

- **📂 Category Browsing**  
  Easily filter news by categories like Technology, Business, Sports, Entertainment, and more.

- **❤️ Save & Read Later**  
  Add your favorite articles to a saved list for later reading, with persistent storage via Firebase.

- **🌙 Light & Dark Mode**  
  Switch between light and dark themes to suit your preference or environment.

- **📱 Responsive UI**  
  Modern and clean interface optimized for all screen sizes using `flutter_screenutil`.

---

## 🏗 Architecture

- **Clean Architecture** with feature-based folder structure  
- **MVVM Pattern** for scalable code organization  
- **BLoC / Cubit** for reactive state management

---

## 🚀 Getting Started

### Prerequisites

- ✅ Flutter SDK (3.0 or higher recommended)  
- 🔑 A news API key (e.g., from [newsapi.org](https://newsapi.org))  
- 🔥 Firebase project setup  
- 🌐 Internet connection for API access

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/news_app.git
cd news_app

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## 🔥 Firebase Setup

This project integrates with **Firebase Firestore** to store user preferences and favorite articles.

Make sure to:

- Create a Firebase project  
- Add `google-services.json` (Android) or `GoogleService-Info.plist` (iOS)  
- Then run:

```bash
flutterfire configure
```

---

## 🌐 API Integration

This app uses the [NewsAPI.org](https://newsapi.org) to fetch real-time news data including:

- 📰 Headlines  
- 📝 Descriptions  
- 🖼️ Images  
- 📅 Publication dates  
- 🏷️ Source info

---

## 📱 Screenshots

| Home | Article | Favorites |
|------|---------|-----------|
| ![Home](assets/screenshots/home.png) | ![Article](assets/screenshots/article.png) | ![Favorites](assets/screenshots/favorites.png) |

---

## 🎥 Demo Video

👉 [Watch Demo Video](https://drive.google.com/file/d/your-video-id/view?usp=sharing)

---

## 👨‍💻 Contributors

- **Your Name** • [@your-github](https://github.com/your-github)  
- _(Add more contributors as needed)_

---

## 📄 License

This project is licensed under the **[MIT License](LICENSE)**.

---

## ⭐ Support

If you find this project useful, please consider giving it a ⭐ on GitHub — it really helps!

---
