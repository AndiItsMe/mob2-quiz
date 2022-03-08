import 'package:flutter/material.dart';
import 'package:quiz/managers/game_manager.dart';
import 'package:quiz/managers/score_manager.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Quiz")),
        body: Center(
            child: Text(
                "You answered ${ScoreManager.instance.score} right questions in ${GameManager.instance.maxQuestions} !",
                style: const TextStyle(color: Colors.black, fontSize: 28))));
  }
}
