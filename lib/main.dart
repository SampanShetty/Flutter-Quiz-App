import 'package:flutter/material.dart';
import 'package:quiz/data.dart';
import 'package:quiz/quiz_screen.dart';
import 'package:quiz/result_screen.dart';
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
  List<String> selectedAnswer = [];
  var screen = 'start-screen';
  void switchScreen() {
    setState(() {
      screen = 'quiz-screen';
    });
  }

  void choosedAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        screen = 'result-screen';
      });
    }
    debugPrint('-----------$selectedAnswer');
  }

  void restartQuiz() {
    selectedAnswer = [];
    setState(() {
      screen = 'quiz-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = Startscreen(switchScreen);
    if (screen == 'quiz-screen') {
      screenWidget = QuizScreen(onselected: choosedAnswer);
    }
    if (screen == 'result-screen') {
      screenWidget = ResultScreen(
        choosedAnswer: selectedAnswer,
        restartQuiz: restartQuiz,
      );
    }
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
          child: screenWidget,
        ),
      ),
    );
  }
}
