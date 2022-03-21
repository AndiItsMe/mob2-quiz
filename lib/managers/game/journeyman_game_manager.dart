import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz/managers/game/game_manager.dart';
import 'package:quiz/managers/question_manager.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/pages/score_page.dart';

class JourneymanGameManager extends GameManager {
  JourneymanGameManager() : super(10);

  @override
  void hasAnswer(BuildContext context, Question question, String answer) {
    if (question.isCorrectAnswer(answer)) {
      $score++;

      $currentQuestionNumber++;

      if ($currentQuestionNumber > maxQuestions) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ScorePage()));
      } else {
        $isHintShown.value = false;
        QuestionManager.instance.next();
      }
    } else {
      $score--;
    }
  }

  static void register() {
    GetIt.I.registerLazySingleton<GameManager>(() => JourneymanGameManager());
  }
}
