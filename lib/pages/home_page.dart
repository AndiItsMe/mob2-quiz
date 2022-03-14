import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:quiz/managers/game_manager.dart';
import 'package:quiz/managers/question_manager.dart';
import 'package:quiz/managers/score_manager.dart';

import 'game_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz")),
      body: _ScrollableGameModeView(),
    );
  }
}

class _ScrollableGameModeView extends StatelessWidget with GetItMixin {
  _ScrollableGameModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - 100,
        ),
        child: Center(
            child: OutlinedButton(
          onPressed: () {
            GameManager.register();
            QuestionManager.register();
            ScoreManager.register();
            GameManager.instance.start(3);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const GamePage()));
          },
          child: Text("Start",
              style: TextStyle(color: Colors.pink[500], fontSize: 20)),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
              side: MaterialStateProperty.all(const BorderSide(
                  color: Colors.pink, width: 1.0, style: BorderStyle.solid))),
        )),
      ),
    );
  }
}
