import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map((data) => Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: (data['user_answer'] ==
                                          data['correct_answer'])
                                      ? Colors.orange
                                      : Colors.redAccent,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Text(
                                "${(data['question_index'] as int) + 1}",
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              )),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['question'] as String,
                                  style: GoogleFonts.lato(
                                      color: const Color.fromARGB(
                                          255, 216, 239, 245),
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(data['user_answer'] as String,
                                    style: GoogleFonts.lato(
                                        color: const Color.fromARGB(
                                            252, 203, 4, 102),
                                        fontSize: 14)),
                                Text(data['correct_answer'] as String,
                                    style: GoogleFonts.lato(
                                        color: const Color.fromARGB(
                                            255, 53, 41, 89),
                                        fontSize: 14))
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      )
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
