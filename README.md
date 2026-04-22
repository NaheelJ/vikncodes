# Vikncodes 🚀

A premium, modular Flutter application built with a focus on high-performance state management and a modern, glassmorphic dark-theme aesthetic.

## ✨ Key Features

- **Modular Architecture**: Scalable feature-based structure (Auth, Home, Invoice, Profile, etc.).
- **Professional Dashboard**: Real-time revenue analytics with interactive month/year selectors.
- **Advanced Invoice Management**: Robust filtering system by date range, status, and multiple customers.
- **Premium UI/UX**: Dark-mode design system with curated color palettes, smooth animations, and SVG-based iconography.
- **Centralized Navigation**: Implemented with GoRouter for declarative, path-based routing.
- **Global State Management**: Powered by Provider for efficient and reactive data flow.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Navigation**: [GoRouter](https://pub.dev/packages/go_router)
- **Styling**: Google Fonts (Poppins, Inter), Custom SVG Icons
- **Formatting**: Intl for localized date and currency handling

## 📂 Project Structure

The project follows a **Feature-First** modular architecture to ensure maximum maintainability and scalability.

```
lib/
├── app/                  # Feature Modules
│   ├── auth/             # Authentication & Splash
│   ├── home/             # Dashboard & Analytics
│   ├── invoice/          # Invoice Lists & Advanced Filtering
│   ├── profile/          # User Profile & Settings
│   ├── route/            # Navigation Routing
│   └── notification/     # User Notifications
├── core/                 # Core utilities
│   ├── bootstrap/        # Global Provider Initialization
│   ├── constants/        # App-wide constants & dummy data
│   └── routes/           # GoRouter Configuration
└── main.dart             # Entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/vikncodes.git
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

## 🎨 Design Principles

- **Contrast & Depth**: Using `#000000` backgrounds with `#0F0F0F` card surfaces for a premium feel.
- **Micro-interactions**: High-visibility action buttons and smooth bottom-sheet transitions.
- **Responsiveness**: Layouts designed to adapt seamlessly across different mobile screen sizes.

---

Built with ❤️ by the Vikncodes Team.
