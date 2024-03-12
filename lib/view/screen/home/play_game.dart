import 'package:air_hockey_game/view/screen/home/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/size.dart';

class PlayGame extends StatefulWidget {
  const PlayGame({super.key});

  @override
  State<PlayGame> createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  @override
  Widget build(BuildContext context) {
    Size size = AppSize.screenSize(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow.shade400,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Image.asset(
                      "assets/icon/back.png",
                      height: 75,
                    ),
                  ),
                  Image.asset(
                    "assets/images/setting.png",
                    height: 75,
                  ),
                ],
              ),
              SizedBox(
                height: size.height / 8,
              ),
              Hero(
                tag: 'circle',
                child: Image.asset(
                  "assets/images/air.png",
                  height: size.height / 8,
                ),
              ),
              SizedBox(
                height: size.height / 12,
              ),
              Image.asset(
                "assets/icon/Player.png",
                height: size.height / 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(GamePage());
                },
                child: Image.asset(
                  "assets/icon/start.png",
                  height: size.height / 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
