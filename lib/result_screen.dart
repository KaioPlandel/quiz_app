import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/data/questions.dart';
import 'package:flutter_01/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.chosenAnswer, required this.onRestart}) : super(key: key);

  final List<String> chosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final sumaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = sumaryData
        .where((data) => data["user_answer"] == data["correct_answer"])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions questions",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 25),
            QuestionSummary(summaryData: sumaryData),
            const SizedBox(height: 30),
            TextButton(onPressed: () {}, child: GestureDetector(
              onTap: onRestart,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(Icons.settings_backup_restore_rounded, color: Colors.white),
                SizedBox(width: 6),
                Text("Restart Quiz")
              ],),
            ))
          ],
        ),
      ),
    );
  }
}
