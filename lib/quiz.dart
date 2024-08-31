import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void reStart() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = activeScreen == 'start-screen'
        ? StartScreen(startQuiz: switchScreen)
        : QuestionScreen(
            onSelectAnswer: chooseAnswer,
          );
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestart: reStart,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color.fromARGB(255, 109, 54, 204),
                Color.fromARGB(255, 135, 96, 202)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
