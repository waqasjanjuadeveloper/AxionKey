# Implementation Plan - State Management with Provider

This plan outlines the integration of the `provider` package to manage the state of password entries across the application. This will decouple the UI from Firestore logic and provide a more reactive experience.

## User Review Required

> [!IMPORTANT]
> - **Dependency Addition**: I will add `provider: ^6.1.2` to `pubspec.yaml`.
> - **Architectural Shift**: Logic currently in `HomeScreen`, `AddPassword`, and `EditPassword` will move to a `PasswordProvider`.

## Proposed Changes

### [Core]

#### [MODIFY] [pubspec.yaml](file:///E:/studioprojects/axionkey/axionkey/pubspec.yaml)
- Add `provider: ^6.1.2` to the dependencies section.

### [Models & State Management]

#### [NEW] [password_model.dart](file:///E:/studioprojects/axionkey/axionkey/lib/models/password_model.dart)
- Define a `PasswordModel` class with fields for `id`, `website`, `email`, `password`, and `note`.
- Add `fromMap` and `toMap` methods for Firestore integration.

#### [NEW] [password_provider.dart](file:///E:/studioprojects/axionkey/axionkey/lib/providers/password_provider.dart)
- Create `PasswordProvider` extending `ChangeNotifier`.
- Move Firestore operations (`fetch`, `add`, `update`, `delete`) into this provider.
- Maintain a local list of `PasswordModel` objects.

### [UI Refactoring]

#### [MODIFY] [main.dart](file:///E:/studioprojects/axionkey/axionkey/lib/main.dart)
- Wrap the `MyApp` with `ChangeNotifierProvider`.

#### [MODIFY] [home_screen.dart](file:///E:/studioprojects/axionkey/axionkey/lib/screens/home/home_screen.dart)
- Use `context.watch<PasswordProvider>()` or `Consumer` to display the list.
- Remove local state and Firestore reference.

#### [MODIFY] [add_password.dart](file:///E:/studioprojects/axionkey/axionkey/lib/screens/addpassword/add_password.dart)
- Call `passwordProvider.addPassword()` instead of direct Firestore call.

#### [MODIFY] [edit_password.dart](file:///E:/studioprojects/axionkey/axionkey/lib/screens/addpassword/edit_password.dart)
- Call `passwordProvider.updatePassword()` and `passwordProvider.deletePassword()`.

## Verification Plan

### Automated Tests
- Static analysis to ensure provider is correctly implemented.

### Manual Verification
- Verify that adding/updating/deleting an entry immediately updates the list on the Home screen.
- Verify that the app still fetches data correctly on startup.
