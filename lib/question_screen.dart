import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

import 'answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key, required this.chooseAnswer})
      : super(key: key);

  final void Function(String anwser) chooseAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentListIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.chooseAnswer(selectedAnswer);

    setState(() {
      currentListIndex++;
    });
  }



  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentListIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.familjenGrotesk(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffedAnswers().map((answer) {
              return AnswerButton(
                onButtonClick: () {
                  answerQuestion(answer);
                },
                buttonLabel: answer,
              );
            })
          ],
        ),
      ),
    );
  }
}
