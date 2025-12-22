import 'package:flutter/material.dart';
import 'package:quiz/quiz_screen.dart';
import 'package:quiz/startScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var screen = 'start-screen';
  void switchScreen() {
    setState(() {
      screen = 'quiz-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2563EB), // Blue
                Color(0xFF1D4ED8), // Darker Blue
              ],
            ),
          ),
          child: screen == 'start-screen'
              ? Startscreen(switchScreen)
              : QuizScreen(),
        ),
      ),
    );
  }
}
