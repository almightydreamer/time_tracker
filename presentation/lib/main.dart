import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:dependency_injection/dependency_injection.dart' as di;
import 'package:page_transition/page_transition.dart';
import 'package:presentation/pages/home/home_page.dart';
import 'package:presentation/pages/splash_screen/splash_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          canvasColor: Colors.transparent,
        ),
        home: const HomePage());
  }
}
