import 'package:flutter/material.dart';
import 'package:vault_app/presentation/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Vault',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
