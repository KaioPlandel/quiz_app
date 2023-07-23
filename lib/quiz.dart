import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/data/questions.dart';
import 'package:flutter_01/question_screen.dart';
import 'package:flutter_01/result_screen.dart';
import 'package:flutter_01/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start_screen";
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = "question_screen";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void switchScreen() {
      setState(() {
        activeScreen = "question_screen";
      });
    }

    void chooseAnwser(String anwser) {
      selectedAnswers.add(anwser);
      if (selectedAnswers.length == questions.length) {
        setState(() {
          activeScreen = "results_screen";
        });
      }
    }

    void restartQuiz() {
      setState(() {
        selectedAnswers = [];
        activeScreen = "question_screen";
      });
    }

    var screenWidget = activeScreen == "start_screen"
        ? StartScreen(startQuiz: switchScreen)
        : QuestionScreen(
            chooseAnswer: chooseAnwser,
          );

    if (activeScreen == "results_screen") {
      screenWidget = ResultScreen(
        chosenAnswer: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: screenWidget),
      ),
    );
  }
}
