import 'package:flutter/material.dart';
import 'package:quiz/data.dart';
import 'package:quiz/summary_data_widget.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.choosedAnswer,
    required this.restartQuiz,
  });
  final List<String> choosedAnswer;
  final void Function() restartQuiz;
  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < choosedAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "user_answer": choosedAnswer[i],
        "correct_answer": questions[i].answer[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numberOfQuestions = questions.length;
    final numberOfCorrectAnswered = getSummary().where((data) {
      return data["user_answer"] == data["correct_answer"];
    });
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You haev answered ${numberOfCorrectAnswered.length} out of $numberOfQuestions questions correctly',
              style: TextStyle(color: Colors.cyanAccent, fontSize: 15),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            SummaryDataWidget(summaryData: getSummary()),
            const SizedBox(height: 30),
            TextButton.icon(
              icon: Icon(Icons.restart_alt),
              style: TextButton.styleFrom(foregroundColor: Colors.deepOrange),
              onPressed: () {
                restartQuiz();
              },
              label: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
