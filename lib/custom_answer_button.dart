import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAnswerButton extends StatelessWidget {
  CustomAnswerButton({super.key, required this.text, required this.ontap});

  String text;
  void Function() ontap;
  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: ontap,
        child: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
