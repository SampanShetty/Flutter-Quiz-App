import 'package:flutter/material.dart';

class SummaryDataWidget extends StatelessWidget {
  const SummaryDataWidget({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: data['user_answer'] == data['correct_answer']
                    ? Colors.green
                    : Colors.red,
                child: Text(
                  ((data["question_index"] as int) + 1).toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Align(
                alignment: AlignmentGeometry.topLeft,
                child: Text(
                  data["question"] as String,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
              subtitle: Column(
                children: [
                  Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text(
                      data["correct_answer"] as String,
                      style: TextStyle(color: Colors.green),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text(
                      data['user_answer'] as String,
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            );

            // Row(
            //   children: [
            //     Text(((data["question_index"] as int) + 1).toString()),
            //     Expanded(
            //       child: Column(
            //         children: [
            //           Text(data["question"] as String),
            //           Text(data['user_answer'] as String),
            //           Text(data["correct_answer"] as String),
            //         ],
            //       ),
            //     ),
            //   ],
            // );
          }).toList(),
        ),
      ),
    );
  }
}
