import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() => runApp(const GatoCafeApp());

class GatoCafeApp extends StatelessWidget {
  const GatoCafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miau Café',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8D5B3B), // café
          secondary: const Color(0xFFF2A65A), // naranja gato
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF8F0),
      ),
      home: const SplashScreen(),
    );
  }
}
