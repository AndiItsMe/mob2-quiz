import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz/managers/question_manager.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/pages/score_page.dart';

class GameManager {
  int _maxQuestions = 1;

  int $currentQuestionNumber = 1;
  int $score = 0;
  final $isHintShown = ValueNotifier<bool>(false);

  GameManager([int maxQuestions = 0]) {
    _maxQuestions = maxQuestions;
  }

  // Here only to implement ValueListenable, will never be used.
  get value => this;

  get maxQuestions => _maxQuestions;

  get currentQuestionNumber => $currentQuestionNumber;
  get isHintShown => $isHintShown;
  get score => $score;

  void play(BuildContext context, Question question, String answer) {
    if (question.isCorrectAnswer(answer)) {
      $score++;
    }

    $currentQuestionNumber++;

    if ($currentQuestionNumber > _maxQuestions) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ScorePage()));
    } else {
      $isHintShown.value = false;
      QuestionManager.instance.next();
    }
  }

  void toggleHint() {
    $isHintShown.value = !$isHintShown.value;
  }

  static void start() {
    QuestionManager.register();
  }

  static get instance => GetIt.I.get<GameManager>();
}
