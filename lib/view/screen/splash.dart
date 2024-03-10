import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.to(() => HomeScreen());
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
                    color: Colors.green,
                    offset: const Offset(-4, -4),
                    blurRadius: 20,
                  ),
                  BoxShadow(
                    color: Colors.green,
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
      ),
    );
  }
}
