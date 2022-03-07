import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:quiz/managers/question_manager.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/widgets/question_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
        actions: [
          IconButton(
            icon: Icon(Icons.restart_alt),
            onPressed: () => {},
          ),
        ],
      ),
      body: _ScrollableQuestionView(),
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

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          QuestionView(question),
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
