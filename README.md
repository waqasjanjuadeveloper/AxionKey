# AxionKey 🛡️

**AxionKey** is a modern and secure password manager built with Flutter and Firebase. It provides a centralized place for users to store, manage, and retrieve their digital credentials safely, ensuring they never lose access to their accounts.

## 🚀 Features

- **Secure Authentication**: User signup, login, and password recovery powered by Firebase Authentication.
- **Credential Management**: Full CRUD (Create, Read, Update, Delete) functionality for managing account details (Website, Email/Username, Password, and Notes).
- **Reactive State Management**: Integrated with the `Provider` package for a seamless and responsive user experience.
- **Modern UI/UX**:
  - Clean and intuitive dashboard.
  - Revamped Profile and Settings screen.
  - Specialized Password Update screen with re-authentication security.
  - Onboarding flow for new users.
- **Cloud Sync**: All data is securely stored and synchronized across devices using Google Cloud Firestore.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **Backend**: [Firebase](https://firebase.google.com/)
  - Firebase Authentication
  - Cloud Firestore
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Theme**: Custom Material 3 styling

## 📦 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Firebase Account](https://console.firebase.google.com/)

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/axionkey.git
   cd axionkey
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**:
   - Create a new Firebase project in the Firebase Console.
   - Add an Android/iOS app and download the configuration files (`google-services.json` or `GoogleService-Info.plist`).
   - Enable **Email/Password** authentication.
   - Set up a **Cloud Firestore** database.

4. **Run the app**:
   ```bash
   flutter run
   ```

## 🏗️ Project Structure

```text
lib/
├── models/         # Data models (PasswordModel, etc.)
├── providers/      # State management (PasswordProvider)
├── screens/        # UI Screens (Auth, Home, Settings, etc.)
├── theme/          # App colors and theme definitions
├── widgets/        # Reusable UI components
└── main.dart       # App entry point
```

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---
*AxionKey - Keep your digital life secure.*
