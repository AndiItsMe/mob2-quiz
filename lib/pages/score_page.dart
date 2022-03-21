import 'package:flutter/material.dart';
import 'package:quiz/managers/game/game_manager.dart';
import 'package:quiz/pages/home_page.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Quiz")),
        body: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 100,
                ),
                child: Center(
                    child: Column(children: <Widget>[
                  Text(
                      "You made " +
                          GameManager.instance.score.toString() +
                          " points",
                      style: const TextStyle(color: Colors.pink, fontSize: 28)),
                  Text(
                      "out of " +
                          GameManager.instance.maxQuestions.toString() +
                          " !",
                      style:
                          const TextStyle(color: Colors.black, fontSize: 28)),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: Text("New Game",
                        style:
                            TextStyle(color: Colors.pink[500], fontSize: 20)),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                        side: MaterialStateProperty.all(const BorderSide(
                            color: Colors.pink,
                            width: 1.0,
                            style: BorderStyle.solid))),
                  )
                ])))));
  }
}
