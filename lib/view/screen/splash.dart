import 'package:air_hockey_game/view/screen/home/play_game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 3), () {
          Get.off(const PlayGame());
        });
      }
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = AppSize.screenSize(context);
    return Scaffold(
      backgroundColor: Colors.yellow.shade400,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Hero(
            tag: 'circle',
            child: Image.asset(
              "assets/images/air.png",
              height: size.height / 7,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
