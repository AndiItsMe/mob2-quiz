import 'package:quiz/managers/game/game_manager.dart';
import 'package:get_it/get_it.dart';

class RookieGameManager extends GameManager {
  RookieGameManager() : super(10);

  static void start() {
    GameManager.start();
    GetIt.I.registerLazySingleton<GameManager>(() => RookieGameManager());
  }
}
