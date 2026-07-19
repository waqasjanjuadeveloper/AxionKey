import 'package:axionkey/screens/addpassword/add_password.dart';
import 'package:axionkey/screens/addpassword/edit_password.dart';
import 'package:axionkey/screens/auth/forgotpassword/forgotpassword.dart';
import 'package:axionkey/screens/auth/login/login_screen.dart';
import 'package:axionkey/screens/auth/signup/signup_screen.dart';
import 'package:axionkey/screens/main_screen.dart';
import 'package:axionkey/screens/onboarding/onboarding_screen.dart';
import 'package:axionkey/screens/settings/password_update_screen.dart';
import 'package:axionkey/screens/settings/settings_screen.dart';
import 'package:axionkey/screens/splash/splash_screen.dart';
import 'package:axionkey/screens/theme/app_theme.dart';
import 'package:axionkey/providers/password_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/main': (context) => const MainScreen(),
          '/signup': (context) => const SignupScreen(),
          '/forgotpassword': (context) => const Forgotpassword(),
          '/onboardingscreen': (context) => const OnboardingScreen(),
          '/settingscreen': (context) => const SettingsScreen(),
          '/addpassword': (context) => const AddPassword(),
          '/editpassword': (context) => const EditPassword(),
          '/updatepassword': (context) => const PasswordUpdateScreen(),
        });
  }
}
