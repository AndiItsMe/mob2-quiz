import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/services/question_ruby_provider.dart';
import 'package:quiz/services/question_provider.dart';

class QuestionManager {
  final QuestionProvider _provider;
  late final StreamController<Question> _streamController;

  QuestionManager(this._provider) {
    _streamController = StreamController();
    next();
  }

  void next() async {
    _streamController.add(await _provider.fetch());
  }

  Stream<Question> get stream => _streamController.stream;

  static void register() {
    GetIt.I
        .registerLazySingleton(() => QuestionManager(QuestionRubyProvider()));
  }

  static QuestionManager get instance => GetIt.I.get<QuestionManager>();
}
