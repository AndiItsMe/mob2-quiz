import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz/managers/score_manager.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/pages/score_page.dart';

class GameManager {
  int maxQuestions = 0;
  int current = 0;

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
    }
  }

  int get currentQuestionNumber => current + 1;

  // Here only to implement ValueListenable, will never be used.
  GameManager get value => this;

  static void register() {
    GetIt.I.registerLazySingleton(() => GameManager());
  }

  static GameManager get instance => GetIt.I.get<GameManager>();
}
