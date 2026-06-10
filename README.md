# QuickSlot Frontend

QuickSlot is a beautiful, modern, and highly responsive Flutter application designed for booking sports venues. Built with a focus on seamless user experience, it features dynamic themes, smooth micro-animations, custom date pickers, and instant background data synchronization.

This frontend connects to the QuickSlot backend API to fetch available venues, view time slots, and securely lock in bookings.

## 📱 Screenshots
<img width="1280" height="2856" alt="Screenshot_1781117715" src="https://github.com/user-attachments/assets/33113b06-f1c8-471b-980b-3a11f28f6283" />

<img width="1280" height="2856" alt="Screenshot_1781117723" src="https://github.com/user-attachments/assets/f7a9334e-7bec-45b1-b7a7-380950f65102" />

<img width="1280" height="2856" alt="Screenshot_1781117945" src="https://github.com/user-attachments/assets/c3f7aa6e-e230-4339-bf51-e5a3246838dd" />

<img width="1280" height="2856" alt="Screenshot_1781117754" src="https://github.com/user-attachments/assets/f8b29ce8-f068-4ed5-8f99-24ea72103977" />

<img width="1280" height="2856" alt="Screenshot_1781118032" src="https://github.com/user-attachments/assets/b6491da1-d97c-4fe1-b651-8c0b0c95496e" />



## 🛠️ Technology Stack
- **Framework:** Flutter (Dart)
- **State Management:** Riverpod 2.0 (with `StateNotifier` and `FutureProvider`)
- **Networking:** Dio (HTTP client with interceptors)
- **Routing:** GoRouter (Declarative routing)
- **Local Storage:** SharedPreferences (User session management)
- **Animations:** Shimmer (Custom tailored loading skeletons)

## ✨ Key Features
- **Modern UI/UX:** Glassmorphism cards, dynamic indigo gradients, and crisp typography.
- **Dark/Light Mode:** Instant, full-app theme toggling managed globally via Riverpod.
- **Smart Pull-to-Refresh:** Seamlessly updates data in the background without wiping the screen or flashing loading states.
- **Real-Time Slots:** View available and booked slots instantly via the sleek horizontal date scroller and dynamic grid.
- **Instant Booking Management:** Cancel bookings with immediate visual feedback and background synchronization.

## 📂 Project Architecture
This project follows a strict feature-first architecture for maximum scalability:
```text
frontend/
├── lib/
│   ├── core/              # App-wide shared resources
│   │   ├── network/       # API Client (Dio configuration)
│   │   ├── theme/         # Light/Dark mode configurations and ThemeProvider
│   │   └── widgets/       # Global reusable widgets (e.g., Loaders, Shimmers)
│   ├── features/          # Feature modules
│   │   ├── auth/          # User selection and dummy auth providers
│   │   ├── bookings/      # My Bookings screen, models, and repositories
│   │   └── venues/        # Venue listing, slot grids, and details screen
│   ├── routes/            # GoRouter configuration
│   └── main.dart          # Application entry point and ProviderScope
└── pubspec.yaml           # Flutter dependencies
```

## 🚀 Getting Started

### 1. Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Version 3.10+)
- iOS Simulator or Android Emulator (or a physical device)

### 2. Installation
Clone the repository and install the Flutter dependencies:
```bash
cd frontend
flutter pub get
```

### 3. API Configuration
The application is currently configured to point to the live Production API hosted on Render:
`https://quickslot-backend-g4ed.onrender.com/api/v1`

If you wish to test against a local backend, update `lib/core/network/api_client.dart`:
```dart
return 'http://10.0.2.2:8000/api/v1'; // Android Emulator
// OR
return 'http://localhost:8000/api/v1'; // iOS Simulator
```

### 4. Run the App
Launch the app on your connected device or simulator:
```bash
flutter run
```

---
*Built for the Swadesh AI Hackathon.*
