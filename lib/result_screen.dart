import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});
  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 210, 202, 224),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                QuestionSummary(
                  summaryData: summaryData,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  onPressed: onRestart,
                  label: const Text(
                    'Restart Quiz!',
                  ),
                  icon: const Icon(
                    Icons.refresh,
                  ),
                )
              ],
            )));
  }
}
