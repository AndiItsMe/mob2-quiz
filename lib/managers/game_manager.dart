import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz/managers/question_manager.dart';
import 'package:quiz/managers/score_manager.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/pages/score_page.dart';

class GameManager {
  int maxQuestions = 0;
  int current = 0;
  final _isHintShown = ValueNotifier<bool>(false);

  void start(int maxQuestions) {
    this.maxQuestions = maxQuestions;
  }

  void hasAnswer(BuildContext context, Question question, String answer) {
    if (question.isCorrectAnswer(answer)) {
      ScoreManager.instance.addPoints(1);
    }

    current++;

    if (current == maxQuestions) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ScorePage()));
    } else {
      _isHintShown.value = false;
      QuestionManager.instance.next();
    }
  }

  void toggleHint() {
    _isHintShown.value = !_isHintShown.value;
  }

  int get currentQuestionNumber => current + 1;

  get isHintShown => _isHintShown;

  // Here only to implement ValueListenable, will never be used.
  GameManager get value => this;

  static void register() {
    GetIt.I.registerLazySingleton(() => GameManager());
  }

  static GameManager get instance => GetIt.I.get<GameManager>();
}
