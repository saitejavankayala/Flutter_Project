import 'package:flutter/material.dart';

class Question  extends StatelessWidget {
  final VoidCallback answerQuestionFunc;
  final String value;

  Question(this.answerQuestionFunc, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    width: double.maxFinite,
    child: ElevatedButton(onPressed: answerQuestionFunc, child: Text(value, style: const TextStyle(color: Colors.cyanAccent),)),
    );
  }
}
