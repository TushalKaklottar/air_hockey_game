import 'package:air_hockey_game/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Air hockey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyRoutes.splashRoutes(),
      getPages: MyRoutes.routes,
    );
  }
}
