import 'package:air_hockey_game/view/screen/home/play_game.dart';
import 'package:air_hockey_game/view/screen/splash.dart';
import 'package:get/get.dart';

import '../view/screen/game_screen.dart';

class MyRoutes {
  static const String _splash = "/";
  static const String _playGame = "/playGame";
  static const String _home = "/playGame";

  static String splashRoutes() => _splash;
  static String playGameRoutes() => _playGame;
  static String homeRoutes() => _home;

  static List<GetPage> routes = [
    GetPage(
      name: _splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _playGame,
      page: () => PlayGame(),
    ),
    GetPage(
      name: _home,
      page: () => GamePage(),
    ),
  ];
}
