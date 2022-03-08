import 'package:get_it/get_it.dart';

class ScoreManager {
  int score = 0;

  void addPoints(int points) {
    score += points;
  }

  // Here only to implement ValueListenable, will never be used.
  ScoreManager get value => this;

  static void register() {
    GetIt.I.registerLazySingleton(() => ScoreManager());
  }

  static ScoreManager get instance => GetIt.I.get<ScoreManager>();
}
