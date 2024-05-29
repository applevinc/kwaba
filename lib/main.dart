import 'package:flutter/material.dart';
import 'package:kwaba/screens/home/home.screen.dart';
import 'package:kwaba/styles/theme.dart';
import 'package:screenshot/screenshot.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kwaba',
      theme: AppTheme.theme,
      home: const HomeScreen(),
    );
  }
}
