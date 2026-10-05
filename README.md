# Flutter Interview Project: Users Directory App

A clean, modern, and production-ready Flutter application built for an interview technical task. It demonstrates clean architecture, reactive state management using **flutter_bloc (Cubit)**, REST API integration with timeout & comprehensive error handling, input validation, and Material 3 design with smooth Hero animations.

---

## 📱 Features

### 1. Login Screen (UI Only)
- **Modern Material 3 Design:** Responsive card layout with intuitive typography and spacing.
- **Form Validation:**
  - Empty field detection for email and password.
  - RFC 5322 regex email format verification.
  - Minimum 6-character length enforcement for password.
- **Interactive UI:** Password obscurity toggle with visibility icon.
- **Seamless Navigation:** Transitions to the Home screen upon successful validation.

### 2. Home Screen (Users List)
- **Data Source:** Fetches user profiles from `https://jsonplaceholder.typicode.com/users`.
- **Reactive State Management:** Powered by `UsersCubit` handling:
  - `UsersInitial`
  - `UsersLoading` (displays `CircularProgressIndicator`)
  - `UsersSuccess` (renders `ListView.builder` with user cards)
  - `UsersFailure` (displays user-friendly error messages with a **Try Again** button)
- **User Cards:** Displays avatar initial, full name, email, and company name.
- **Pull-to-Refresh:** Pull down or click the refresh action button to re-fetch the latest users list.

### 3. User Details Screen
- **Hero Animation:** Shared avatar circle transition between the list item and the details screen.
- **Organized Sections:**
  - **Profile Header:** Name and `@username`.
  - **Contact Information:** Email, phone, and website.
  - **Address:** Street, suite, city, zipcode, and geo coordinates.
  - **Company Information:** Company name, catchphrase, and business strategy.

---

## 🏗️ Architecture & Folder Structure

The project follows a layered architecture (UI, Logic, Data) for clarity, testability, and maintainability:

```text
lib/
├── models/
│   └── user_model.dart        # User, Address, Geo, Company data models with fromJson & toJson
├── services/
│   └── user_api_service.dart  # UserApiService with 10s timeout, custom exceptions & network handling
├── cubit/
│   ├── users_state.dart       # Cubit states: Initial, Loading, Success, Failure
│   └── users_cubit.dart       # Business logic component for fetching and emitting user states
├── screens/
│   ├── login_screen.dart      # Login UI with Form validation
│   ├── home_screen.dart       # User list with Pull-to-refresh & error states
│   └── user_details_screen.dart # Detailed profile view with Hero animation
└── main.dart                  # App entry point, Material 3 theme & BlocProvider configuration
```

---

## 🛡️ Error Handling & Resiliency

The API layer (`UserApiService`) handles edge cases and network failures gracefully:
- **10-Second Timeout (`TimeoutException`):** Prevents hanging requests and displays "Request timed out".
- **No Internet / Network Failure (`SocketException`, `ClientException`):** Displays "No internet connection. Please verify your network".
- **Server Errors (Non-200 Status Codes):** Identifies HTTP status codes and prompts retry.
- **Corrupt / Unexpected Data (`FormatException`):** Safely handles decoding issues.

---

## 🧪 Testing

The project includes unit and widget tests covering:
- JSON parsing and null-safety validation for models.
- Login screen rendering and form validation checks.

To run the tests:
```bash
flutter test
```

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.11+ / 3.41+)
- Android Studio, VS Code, or Antigravity IDE

### Installation & Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/MuhammedShibilameri/interview_project.git
   cd interview_project
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run on your connected device or emulator:**
   ```bash
   flutter run
   ```
   Or specify platform:
   ```bash
   flutter run -d chrome
   flutter run -d windows
   ```
