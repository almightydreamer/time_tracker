import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/resources/custom_colors.dart';

import '../controllers/movie_details_controller.dart';

class MovieRuntimeBar extends StatelessWidget {
  const MovieRuntimeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieDetailsController controller = Get.find();
    controller.movieCurrentTime.value = 100;
    return Container(
      height: 10,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 3,
            width: MediaQuery.of(context).size.width - 55,
            margin: EdgeInsets.only(right: 10, left: 13),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(2), color: CustomColor.white.withOpacity(0.5)),
          ),
          Container(
            height: 3,
            width: (MediaQuery.of(context).size.width - 55) *
                controller.movieCurrentTime.value /
                controller.movieTotalTime.value,
            margin: EdgeInsets.only(right: 10, left: 13),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: CustomColor.strawberryPop),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width - 55) *
                controller.movieCurrentTime.value /
                controller.movieTotalTime.value +10,
            child: Icon(
              Icons.circle,
              size: 10,
              color: CustomColor.white,
            ),
          )
        ],
      ),
    );
  }
}
