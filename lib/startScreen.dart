import 'package:flutter/material.dart';

class Startscreen extends StatelessWidget {
  Startscreen(this.switchScreen, {super.key});
  void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 300,
            color: Colors.white.withOpacity(0.6),
          ),
          SizedBox(height: 30),
          Text(
            'Learn the Flutter in Fun way.....',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 30),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              overlayColor: Colors.white,
            ),
            onPressed: () {
              switchScreen();
            },
            icon: Icon(Icons.arrow_forward),
            label: Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
