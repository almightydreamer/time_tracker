import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../resources/custom_colors.dart';
import '../../../resources/text_styles.dart';

class TimeLinePage extends StatefulWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
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
    dropdownValue = list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 56,
            ),
            Text(
              "This is your timeline",
              style: TextStyles.robotoCondensed15w400
                  .copyWith(height: 1.71, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  "Select Date: ",
                  style: TextStyles.robotoCondensed15w400
                      .copyWith(height: 1.71, fontWeight: FontWeight.w600),
                ),
                /*DropdownButton(
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
                      child: Text(value),
                    );
                  }).toList(),
                ),*/
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 2,
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Colors.lightGreen,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            child: Text(
                              "8:00 ",
                              style: TextStyles.robotoCondensed22w400.copyWith(
                                  height: 1.71, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 50,
                            height: 3,
                            color: Colors.lightGreen,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            //padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Text(
                              actions[index],
                              style: TextStyles.robotoCondensed22w400.copyWith(
                                  height: 1.71, fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: (actions.length != index+1) ? Container(
                          width: 3,
                          height: 40,
                          color: Colors.lightGreen,
                        ) : Expanded(
                            child: Container(
                            ),
                          ),
                        ),


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
