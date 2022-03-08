import 'package:flutter/material.dart';
import 'package:quiz/managers/game_manager.dart';
import 'package:quiz/managers/question_manager.dart';
import 'package:quiz/managers/score_manager.dart';
import 'package:quiz/pages/home_page.dart';

void main() {
  GameManager.register();
  QuestionManager.register();
  ScoreManager.register();

  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(),
    );
  }
}
