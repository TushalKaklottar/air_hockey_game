import 'package:air_hockey_game/view/screen/home/home_screen.dart';
import 'package:air_hockey_game/view/screen/splash.dart';
import 'package:get/get.dart';

class MyRoutes {
  static const String _splash = "/";
  static const String _home = "/home";

  static String splashRoutes() => _splash;
  static String homeRoutes() => _home;

  static List<GetPage> routes = [
    GetPage(
      name: _splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _home,
      page: () => HomeScreen(),
    ),
  ];
}
