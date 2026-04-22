# Vikncodes 🚀

A premium, modular Flutter application built with a focus on high-performance state management and a modern, glassmorphic dark-theme aesthetic.

## 📝 Project Overview

Vikncodes is a high-fidelity business management mobile application designed to provide users with a seamless, intuitive, and visually stunning interface for managing financial data, invoices, and business metrics. The project prioritizes **developer experience** through its modular architecture and **user experience** through its premium dark-mode design system.

## ✨ Key Features

- **Auth & Onboarding**: Secure login system with API-backed authentication and session persistence.
- **Dynamic Dashboard**: Real-time analytics with interactive revenue charts and date-based filtering.
- **Modular Invoicing**: Full-featured invoice management system with advanced multi-parameter search and filtering.
- **User Personalization**: Customizable profile management including KYC verification status and detailed business preferences.
- **Unified Navigation**: A sophisticated custom-animated bottom navigation bar for effortless context switching.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Navigation**: [GoRouter](https://pub.dev/packages/go_router)
- **Styling**: Google Fonts (Poppins, Inter), Custom SVG Icons
- **Formatting**: Intl for localized date and currency handling

## 📂 Project Structure

### 💻 Code Architecture
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

### 🖼️ Assets Structure
A strictly organized asset management system for optimized resource loading.

```
assets/
├── icons/                # SVG-based vector iconography
│   ├── home-icon.svg
│   ├── invoice-icon.svg
│   ├── profile-icon.svg
│   ├── logout-icon.svg
│   └── ... (18+ custom icons)
└── images/               # Raster images & illustrations
```

## 🔌 API Integration

The application integrates with the Vikn Books REST API to manage authentication and user data.

- **Base URL**: `https://www.api.viknbooks.com/api/v10/`
- **Endpoints**:
  - `POST /users/login`: Authenticates the user and returns an access token.
  - `GET /users/user-view/{userID}/`: Retrieves detailed profile information for the authenticated user.
- **Authentication**: Uses **Bearer Token** authentication in the request headers for all protected routes.

## 💾 Local Storage

We use [Shared Preferences](https://pub.dev/packages/shared_preferences) for lightweight, persistent data storage on the device:

- **Token Storage**: Securely stores the JWT access token to maintain user sessions across app restarts.
- **User Metadata**: Persists the `userID` to facilitate quick profile data fetching.
- **Session Management**: Logic implemented to automatically redirect to the login screen if no valid session is found.

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/NaheelJ/vikncodes.git
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
