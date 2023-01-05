import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/home/home_page.dart';
import 'package:presentation/resources/vectors.dart';
import 'package:dependency_injection/dependency_injection.dart' as di;

import '../home/controllers/home_controller.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async{
      await Future.delayed(const Duration(seconds: 5));
      await di.init();
      Get.put(HomeController());
      HomeController controller = Get.find();
      controller.getGenres();
      controller.getMovies([]).whenComplete(
          () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage())));
    });
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Container(child: Assets.splash),
    );
  }
}
