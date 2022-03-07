import 'package:flutter/material.dart';
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
        Text(question.caption,
            style: const TextStyle(color: Colors.black, fontSize: 28)),
        getQuestionAnswers(question.answers)
      ]),
    );
  }

  Widget getQuestionAnswers(List<String> answers) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
          children: answers
              .map((answer) => FlatButton(
                    onPressed: () {},
                    child: Text(answer,
                        style:
                            TextStyle(color: Colors.pink[500], fontSize: 20)),
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.pink,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                  ))
              .toList()),
    );
  }
}
