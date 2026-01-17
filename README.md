# trust_task

<div align="center">
  <table>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/ff2c5036-6525-4c85-aad0-611e85a4ce6f" width="300"/></td>
      <td><img src="https://github.com/user-attachments/assets/d399bcc9-2100-4007-8ee4-6e0bf905345e" width="300"/></td>
    </tr>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/912b146b-0ce6-4912-97f9-43b15c734e26" width="300"/></td>
      <td><img src="https://github.com/user-attachments/assets/1a31274a-500f-4bb4-9fed-803b1347fb18" width="300"/></td>
    </tr>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/dca66aee-5ae5-41b5-8bad-38d35680ca2e" width="300"/></td>
      <td><img src="https://github.com/user-attachments/assets/62788272-95e9-4f30-a0ff-f3b81bcb6293" width="300"/></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><img src="https://github.com/user-attachments/assets/bd2bbf69-78d3-4ac1-9d3c-801a1c029d1a" width="300"/></td>
    </tr>
  </table>
</div>

## 📱 Project Overview

**trust_task** is a Flutter application built as a technical task, following **Clean Architecture** principles and **feature-based modularization**. The project focuses on scalability, testability, and code readability, using modern Flutter best practices.

---

## 🧱 Architecture

The project follows **Clean Architecture** with clear separation of concerns:

* **Presentation** → UI + State Management (BLoC/Cubit)
* **Domain** → Business logic, entities, and use cases
* **Data** → API, DTOs, repositories implementation
* **Core** → Shared utilities, constants, base classes

This structure makes the app easy to maintain, test, and extend.

---

## 📂 Folder Structure (lib)

```
lib/
│── core/
│   ├── di/              # Dependency Injection setup (get_it + injectable)
│   ├── network/         # Dio, interceptors, API configs
│   ├── error/           # Failure & exception handling
│   ├── utils/           # Helpers, extensions, constants
│   └── localization/    # Localization setup
│
│── data/
│   ├── datasources/     # Remote & local data sources
│   ├── models/          # DTOs (json_serializable)
│   ├── repositories/    # Repository implementations
│   └── mappers/         # Model ↔ Entity mappers
│
│── domain/
│   ├── entities/        # Business entities (Equatable)
│   ├── repositories/   # Repository contracts
│   └── usecases/        # Application use cases
│
│── presentation/
│   ├── bloc/            # Cubits / BLoCs
│   ├── screens/         # UI screens
│   ├── widgets/         # Reusable widgets
│   └── routes/          # App navigation
│
│── main.dart             # Application entry point
```

---

## 📦 Used Packages & Purpose

### 🔹 State Management

* **flutter_bloc** → Predictable state management using Cubit/BLoC
* **equatable** → Value comparison for states and entities

### 🔹 Networking

* **retrofit** → Type-safe API client
* **json_annotation / json_serializable** → JSON parsing
* **talker_dio_logger** → API logging and debugging

### 🔹 Dependency Injection

* **get_it** → Service locator
* **injectable** → Automated DI configuration

### 🔹 Localization & UI

* **easy_localization** → Multi-language support
* **cached_network_image** → Image caching
* **lottie** → Animations
* **cupertino_icons** → iOS-style icons

### 🔹 Local Storage & Config

* **shared_preferences** → Simple local storage
* **envied** → Secure environment variables management

---

## 🧪 Dev Dependencies

* **build_runner** → Code generation
* **retrofit_generator** → Retrofit code generation
* **injectable_generator** → DI code generation
* **envied_generator** → Environment config generation
* **flutter_lints** → Code quality & best practices

---

## 🌍 Assets

```
assets/
│── translations/   # Localization JSON files
│── animation/      # Lottie animation files
```

---

## 🚀 Getting Started

```bash
flutter pub get
flutter run
```

For code generation:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## ✅ Key Highlights

* Clean Architecture
* Feature-based structure
* Scalable & testable codebase
* Modern Flutter tooling
* Ready for production-level extension

---

## 👤 Author

**Omar Waheed Mokhtar**

---

If you have any questions or feedback, feel free to reach out 🙌
