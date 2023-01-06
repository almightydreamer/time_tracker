import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/home/widgets/movie_item.dart';
import 'package:presentation/resources/custom_colors.dart';
import 'package:presentation/resources/text_styles.dart';
import 'controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    HomeController controller = Get.find();
    return Scaffold(
      body: Container(),
    );
  }
}
