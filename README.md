# 🗞️ News App

**Mobile News Reader** built with Flutter.

The News App is a beautifully designed mobile application that allows users to explore, read, and save the latest news articles from around the world. Whether you’re interested in technology, business, sports, or breaking headlines — this app offers a smooth and elegant experience.

---

## ✨ Features

- **📰 Real-time News Feed:**  
  Browse the latest news across various categories using live data from a reliable news API (e.g., NewsAPI.org).

- **📄 Detailed Articles:**  
  Read full article previews with headlines, images, publication date, and source attribution.

- **📂 Category Browsing:**  
  Easily filter news by categories like Technology, Business, Sports, Entertainment, and more.

- **❤️ Save & Read Later:**  
  Add your favorite articles to a saved list for later reading, with persistent storage via Firebase.

- **🌙 Light & Dark Mode:**  
  Switch between light and dark themes to suit your preference or environment.

- **📱 Responsive UI:**  
  Modern and clean interface optimized for all screen sizes using `flutter_screenutil`.

---

## 🏗 Architecture

- **Clean Architecture** with feature-based folder structure  
- **MVVM Pattern** for scalable code organization  
- **BLoC / Cubit** for reactive state management

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher recommended)
- A news API key (e.g., from [newsapi.org](https://newsapi.org))
- Firebase project setup
- Internet connection for API access

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/news_app.git
   cd news_app
Install dependencies:

bash
Copy
Edit
flutter pub get
Run the app:

bash
Copy
Edit
flutter run
🔥 Firebase Setup
This project integrates with Firebase Firestore to save user preferences and favorite articles.
Make sure to:

Create a Firebase project

Add google-services.json (Android) or GoogleService-Info.plist (iOS)

Run:

bash
Copy
Edit
flutterfire configure
🌐 API Integration
This app uses the NewsAPI.org or a similar service to fetch real-time news data, including headlines, descriptions, images, and metadata.

📱 Screenshots
Home	Article	Favorites
	

🎥 Demo Video
Watch the demo:
👉 Demo Video

👨‍💻 Contributors
Your Name • @your-github
(Add more contributors if applicable)

📄 License
This project is licensed under the MIT License.

