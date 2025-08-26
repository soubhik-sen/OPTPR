import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'screens/home.dart';

void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logistics Parallax',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark().copyWith(
          primary: AppColors.neon,
          onPrimary: Colors.black,
          surface: AppColors.bg,
          onSurface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: AppColors.bg,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
