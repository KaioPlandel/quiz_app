import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({Key? key, required this.summaryData})
      : super(key: key);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map((data) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: Text(
                          ((data["question_index"] as int) + 1).toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data["question"] as String, style: TextStyle(color: Colors.white),),
                              const SizedBox(height: 5),
                              Text(data["user_answer"] as String, style: const TextStyle(color: Colors.blue),),
                              Text(data["correct_answer"] as String, style: const TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
