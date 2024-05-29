import 'package:flutter/material.dart';
import 'package:kwaba/screens/buddy_savings/buddy_savings.screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const BuddySavingsScreen(),
              ),
            );
          },
          child: const Text('Start Saving'),
        ),
      ),
    );
  }
}
