import 'package:axionkey/screens/home/home_screen.dart';
import 'package:axionkey/screens/settings/settings_screen.dart';
import 'package:axionkey/screens/theme/app_colors.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget>screens=[
    HomeScreen(),
    SettingsScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
                (states) {
              if (states.contains(WidgetState.selected)) {
                return IconThemeData(
                  color: AppColors.whiteColor,
                  size: 30,
                );
              }

              return IconThemeData(
                color: AppColors.grayColor,
                size: 30,
              );
            },
          ),
        ),
        child: NavigationBar(
          animationDuration: const Duration(milliseconds: 600),
          indicatorColor: AppColors.primaryColor,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );



  }

}
