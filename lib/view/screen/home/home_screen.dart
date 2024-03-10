import 'package:air_hockey_game/view/screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => SplashScreen());
              },
              child: Hero(
                tag: 'circle',
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purpleAccent,
                        offset: const Offset(-4, -4),
                        blurRadius: 20,
                      ),
                      BoxShadow(
                        color: Colors.yellow,
                        offset: const Offset(5, 5),
                        blurRadius: 20,
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
