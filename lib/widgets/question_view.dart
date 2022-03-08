import 'package:flutter/material.dart';
import 'package:quiz/managers/game_manager.dart';
import 'package:quiz/managers/question_manager.dart';
import 'package:quiz/models/question.dart';

class QuestionView extends StatelessWidget {
  final Question question;
  final double padding;

  const QuestionView(this.question, {Key? key, this.padding = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Text(
                "Question ${GameManager.instance.currentQuestionNumber}",
                style: const TextStyle(color: Colors.pink, fontSize: 28))),
        Text(question.caption,
            style: const TextStyle(color: Colors.black, fontSize: 28)),
        getQuestionAnswers(context, question.answers)
      ]),
    );
  }

  Widget getQuestionAnswers(BuildContext context, List<String> answers) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
          children: answers
              .map((answer) => OutlinedButton(
                    onPressed: () {
                      GameManager.instance.hasAnswer(context, question, answer);
                      QuestionManager.instance.next();
                    },
                    child: Text(answer,
                        style:
                            TextStyle(color: Colors.pink[500], fontSize: 20)),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                        side: MaterialStateProperty.all(const BorderSide(
                            color: Colors.pink,
                            width: 1.0,
                            style: BorderStyle.solid))),
                  ))
              .toList()),
    );
  }
}
