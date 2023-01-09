import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:presentation/pages/statistics/controllers/statistic_controller.dart';

import '../../resources/custom_colors.dart';
import '../../resources/text_styles.dart';
import '../home/controllers/home_controller.dart';
import '../time_line/controllers/time_line_controller.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  final List actions = ["Running", "Jumping", "Smoking"];

  final List<String> list = <String>[
    "${int.parse(DateFormat('d').format(DateTime.now()))} ${(DateFormat('yMMMM').format(DateTime.now()))}",
    "${int.parse(DateFormat('d').format(DateTime.now())) - 1} ${(DateFormat('yMMMM').format(DateTime.now()))}",
    "${int.parse(DateFormat('d').format(DateTime.now())) - 2} ${(DateFormat('yMMMM').format(DateTime.now()))}",
  ];
  late String dropdownValue;

  final bool isLast = false;

  @override
  void initState() {
    Get.put(TimeLineController());
    Get.put(HomeController());
    Get.put(StatisticController());
    dropdownValue = list.first;
    StatisticController statisticController = Get.find();
    HomeController homeController = Get.find();
    statisticController.getActivities(9);
    homeController.getActions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StatisticController statisticController = Get.find();
    HomeController homeController = Get.find();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        color: CustomColor.darkGreen,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 56,
            ),
            Text(
              "Heres is your statistics",
              style: TextStyles.robotoCondensed22w400.copyWith(
                  height: 1.71,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.white),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  "Select Date:   ",
                  style: TextStyles.robotoCondensed22w400.copyWith(
                      height: 1.71,
                      fontWeight: FontWeight.w600,
                      color: CustomColor.white),
                ),
                DropdownButton(
                  iconEnabledColor: Colors.cyanAccent,
                  dropdownColor: Colors.greenAccent,
                  value: dropdownValue,
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyles.robotoCondensed22w400.copyWith(
                            height: 1.71,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
            Text(
              "Your total activity for TODAY",
              style: TextStyles.robotoCondensed22w400.copyWith(
                  height: 1.71,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.white),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          color: CustomColor.lightGreen,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    homeController.actions[index].name,
                                    style: TextStyles.robotoCondensed22w400
                                        .copyWith(
                                            height: 1.71,
                                            fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    "${statisticController.activities[index].startOfActivity} si ${statisticController.activities[index].endOfActivity} ",
                                    style: TextStyles.robotoCondensed15w400
                                        .copyWith(
                                            height: 1.71,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10)
                    ],
                  );
                },
                itemCount: actions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
