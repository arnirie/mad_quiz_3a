import 'package:flutter/material.dart';
import 'package:mad_quiz_3a/data/questions_list.dart';

class Questions extends StatefulWidget {
  Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final question_list = QUESTIONS_LIST;
  final answer_list = ANSWERS_LIST;
  int questionIndex = 0;
  int score = 0;
  bool isFinished = false;

  void checkAnswer(bool answer) {
    print(answer);
    //check if the answer is to be given a point
    score += answer == answer_list[questionIndex] ? 1 : 0;
    setState(() {
      //3
      if (questionIndex < question_list.length - 1) {
        questionIndex++;
      } else {
        //show score screen
        isFinished = true;
      }
    });
  }

  Widget showQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          question_list[questionIndex],
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w200,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => checkAnswer(true),
                child: const Text('TRUE'),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () => checkAnswer(false),
                child: const Text('FALSE'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget showScore() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Congrats! You got'),
          const SizedBox(
            height: 18,
          ),
          Text(
            '$score/${question_list.length}',
            style: TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 36,
        ),
        child: isFinished ? showScore() : showQuestion(),
      ),
    );
  }
}
