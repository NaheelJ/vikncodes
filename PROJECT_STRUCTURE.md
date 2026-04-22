
# Project Architecture: Feature-Based MVC

This project uses a **feature-based MVC+S (Model-View-Controller-(service)) architecture** for scalable, maintainable Flutter development.

## Overview

Each major feature (e.g., Auth, Home, Template) is organized in its own folder under `lib/app/`, containing its own models, views, and controllers (or providers/notifiers for state management).

### Folder Structure Example

```
lib/
   app/
      home/
         models/         # Data models for Home feature
         views/          # UI for Home feature
            pages/       # Full screens/pages
            widgets/     # Reusable UI components
         controllers/    # Business logic, state, providers
         services/       # Feature-specific services (Firestore, API, DB, etc.)
      auth/
         models/
         views/
         controllers/
         services/
      ...
   core/               # Shared utilities, error handling, constants, base classes, and global services
   ## core Directory Explained

   The `core` directory contains all shared, cross-feature code and resources. It is the foundation for utilities and logic used throughout the app.

   **Typical contents:**
   - `utils/` — General-purpose helper functions, debouncers, throttlers, formatters, etc.
   - `error/` — Error handling classes, custom exceptions, and error display widgets.
   - `constants/` — App-wide constants, keys, and configuration values.
   - `theme/` — Global theme data, color schemes, and text styles.
   - `services/` — Global services (e.g., network, logging, analytics) used by multiple features.
   - `base/` — Abstract base classes, interfaces, and mixins for controllers, models, or widgets.

   **Best practices:**
   - Only place code in `core` if it is reused by multiple features or is truly global.
   - Keep feature-specific logic inside the relevant feature folder, not in `core`.
   - Document utilities and services for easy onboarding and maintenance.
   main.dart           # App entry point
   app.dart            # App widget and routing
```

## Key Patterns & Libraries

- **Navigation:** Use [`go_router`](https://pub.dev/packages/go_router) for all app navigation and routing. Define routes centrally and use declarative navigation in your pages.

- **Models:** Use [`freezed`](https://pub.dev/packages/freezed) and [`json_serializable`](https://pub.dev/packages/json_serializable) for all model classes. This ensures immutability, copyWith, equality, and robust JSON (de)serialization.

### Example: Model with Freezed & JSON Serializable
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
   factory UserModel({
      required String id,
      @JsonKey(name: 'NAME') required String name,
      @JsonKey(name: 'EMAIL') required String email,
   }) = _UserModel;

   factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

   factory UserModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
   ) {
      var data = snapshot.data()!;
      data['id'] = snapshot.id;
      return UserModel.fromJson(data);
   }

   static Map<String, dynamic> toFireStore(UserModel user, SetOptions? options) {
      return user.toJson()..remove('id');
   }
}
```

After updating any freezed model, run:
```sh
dart run build_runner build
```

## MVC+S Layer Responsibilities

- **Model**: Represents data structures and business entities. Handles data parsing, validation, and (optionally) persistence. Use freezed and json_serializable for all models.
   - Example: `User`, `House`, `Ward`, `AdsModel` classes in `models/`.

- **View**: UI components and pages. Purely presentational, receives data via controllers/providers.
   - Example: `HomePage`, `LoginPage` in `views/pages/`.

- **Controller**: Handles business logic, state, and communication between models and views. In Flutter, this is often a `ChangeNotifier`, `Provider`, or `Cubit`.
   - Example: `HomeController`, `AuthProvider` in `controllers/`.

- **Service**: Handles external communication (Firestores, APIs, databases, device features), encapsulates side effects, and provides reusable logic. Services are injected into controllers or models as needed.
   - Example: `AuthService`, `HomeApiService` in `services/`.

## Feature-Based Organization

Each feature is self-contained, with its own MVC layers. This:
- Improves modularity and testability
- Makes onboarding and scaling easier
- Reduces merge conflicts in teams


## Architecture Diagram (ASCII)

```
             ┌────────────┐
             │  main.dart │
             └─────┬──────┘
                   │
             ┌─────▼──────┐
             │  app.dart  │
             └─────┬──────┘
                   │
        ┌──────────┴──────────┐
        │   Feature Module    │
        └──────────┬──────────┘
                   │
   ┌────────────┬──┴─────────┬─────────────┐
   │            │            │             │
┌──▼───┐    ┌───▼───┐   ┌────▼─────┐  ┌────▼────┐
│Model │    │ View  │   │Controller│  │ Service │
└──┬───┘    └───┬───┘   └────┬─────┘  └────┬────┘
   │            │            │             │
   └────────────┴────────────┴─────────────┘

```

## Example: Home Feature

```
lib/app/home/
   models/
      house.dart
      ward.dart
   views/
      pages/
         home_page.dart
         ward_page.dart
      widgets/
         custom_card.dart
         user_avatar.dart
   controllers/
      home_controller.dart
      ward_controller.dart
   services/
      home_api_service.dart
      local_storage_service.dart
```
      home_page.dart
      ward_page.dart
   controllers/
      home_controller.dart
      ward_controller.dart
```



## Notes
- Use go_router for all navigation and route management.
- Use freezed and json_serializable for all model classes; annotate fields with @JsonKey for custom mapping.
- Controllers may use Provider, Riverpod, or other state management.
- Services are injected into controllers or models and handle all external dependencies (API, DB, device, etc.).
- Shared/global services go in core/.
- Each feature can be developed/tested independently.


## Dart Best Practices

- Use `snake_case` for file and folder names (e.g., `user_model.dart`, `home_page.dart`).
- Use `PascalCase` (UpperCamelCase) for class names (e.g., `UserModel`, `HomeController`).
- Use `lowerCamelCase` for variable, method, and parameter names (e.g., `userName`, `fetchData()`).
- PascalCase (UpperCamelCase): Each word starts with a capital letter, no underscores (e.g., `MyClassName`).
- lowerCamelCase: First word starts lowercase, subsequent words start with a capital letter (e.g., `myVariableName`).
- Avoid deprecated or legacy APIs; always prefer modern, recommended Dart/Flutter patterns.
- Keep naming consistent and descriptive throughout the project.
- Add comments wherever possible to explain logic, intent, and complex code for better understanding.
- Use `// TODO:` comments to mark incomplete features, planned improvements, or areas needing attention.

### Git Best Practices

- Write clear, task-based commit messages (not personal names).
- Use imperative mood (e.g., "Add", "Fix", "Update", "Remove").
- Pull latest changes before starting new work to avoid conflicts.
- Resolve merge conflicts promptly and test after resolving.

**Commit Message Examples:**
```
Add user authentication service
Fix crash on empty provider list
Update navigation bar style
```

