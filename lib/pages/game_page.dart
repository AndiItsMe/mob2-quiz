import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:quiz/managers/game_manager.dart';
import 'package:quiz/managers/question_manager.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/widgets/question_view.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz")),
      body: _ScrollableQuestionView(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            GameManager.instance.toggleHint();
          },
          tooltip: 'Hint',
          child: const Text("?", style: TextStyle(fontSize: 28))),
    );
  }
}

class _ScrollableQuestionView extends StatelessWidget with GetItMixin {
  _ScrollableQuestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Connects the the QuoteManager event stream
    AsyncSnapshot<Question> snapshot =
        watchStream((QuestionManager m) => m.stream, Question.none());

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - 100,
        ),
        child: Center(
          child: _buildSnapshot(context, snapshot),
        ),
      ),
    );
  }

  Widget _buildSnapshot(
      BuildContext context, AsyncSnapshot<Question> snapshot) {
    if (snapshot.hasData) {
      final Question question = snapshot.data!;
      bool isHintShown = watchX((GameManager m) => m.isHintShown);

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          QuestionView(question),
          isHintShown
              ? Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(question.hint,
                      style: const TextStyle(
                          fontSize: 28, fontStyle: FontStyle.italic)))
              : const Text("")
        ],
      );
    } else if (snapshot.hasError) {
      return Text('${snapshot.error}',
          style: TextStyle(
              color: Theme.of(context).errorColor,
              fontSize: Theme.of(context).textTheme.headline3?.fontSize));
    }
    return const CircularProgressIndicator();
  }
}
