import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/custom_answer_button.dart';
import 'package:quiz/data.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  void switchQuestion() {
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[currentIndex].text,
              style: GoogleFonts.montserrat(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),

            ...questions[currentIndex].shuffleTheAnswer().map((ans) {
              return CustomAnswerButton(ontap: switchQuestion, text: ans);
            }),

            //  CustomAnswerButton(text: currentIndex.answer[], ontap: () {}),
          ],
        ),
      ),
    );
  }
}
