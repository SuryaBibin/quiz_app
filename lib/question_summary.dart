import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: data['user_answer'] == data['correct_answer']
                        ? Color.fromARGB(255, 1, 131, 236)
                        : Color.fromARGB(255, 194, 115, 218),
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 207, 132, 230),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 25, 140, 235),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
