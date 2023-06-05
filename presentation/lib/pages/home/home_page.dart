import 'dart:async';

import 'package:domain/modules/home/action/entity/action_entity.dart';
import 'package:domain/modules/home/activity/entity/activity_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simple_timer/simple_timer.dart';
import 'controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    Get.put(HomeController());
    HomeController controller = Get.find();
    controller.getActions();
    controller.resumeActivity();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      print(controller.timerValue);
      controller.timerValue++;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    HomeController controller = Get.find();
    ScrollController scrollController = ScrollController(initialScrollOffset: 0);
    TextEditingController newActionController = TextEditingController();

    //controller.saveActions();
    print('activity ${DateFormat.Hms().format(controller.currentActivity.value.startOfActivity)} '
        '|| time ${DateFormat.Hms().format(DateTime.now()).toString()}');

    return Scaffold(
      body: Container(
        color: const Color(0xFF4e6151),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
              ),
              Expanded(
                child: Container(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.separated(
                          controller: scrollController,
                          separatorBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 1,
                              color: Colors.black.withOpacity(0.2),
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return (controller.addingAction.value && index == controller.actions.length - 1)
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width - 30,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF5e8c61),
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: Colors.black)),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width - 50,
                                            child: TextField(
                                              autofocus: true,
                                              controller: newActionController,
                                              onEditingComplete: () {
                                                if (newActionController.text == '') {
                                                  controller.actions.removeAt(controller.actions.length);
                                                  controller.addingAction.value = false;
                                                  newActionController.clear();
                                                  return;
                                                }
                                                controller.addingAction.value = false;
                                                controller.saveActions(ActionEntity(actionName: newActionController.text));
                                                newActionController.clear();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 3),
                                    child: Draggable(
                                      data: controller.actions[index],
                                      feedback: Container(
                                        height: 50,
                                        width: MediaQuery.of(context).size.width - 30,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF5e8c61),
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(color: Colors.black)),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width - 50,
                                              child: Text("${controller.actions[index].actionName}"),
                                            ),
                                          ],
                                        ),
                                      ),
                                      childWhenDragging: Container(
                                        height: 50,
                                      ),
                                      child: Container(
                                        height: 50,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF5e8c61),
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(color: Colors.black)),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 100,
                                              child: Text(controller.actions[index].actionName),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                          },
                          itemCount: (controller.actions.length),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        right: 16,
                        child: InkWell(
                          onTap: () {
                            controller.addingAction.value = true;
                            controller.actions.add(ActionEntity(actionName: ''));
                            scrollController.animateTo(scrollController.position.maxScrollExtent + 60,
                                duration: Duration(milliseconds: 500), curve: Curves.linear);
                          },
                          child: Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: Color(0xFF94e8b4),
                              borderRadius: BorderRadius.circular(64),
                            ),
                            child: Center(
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF5e8c61),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF3b322c),
                      blurRadius: 0,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: DragTarget<ActionEntity>(onAccept: (ActionEntity action) {
                  print('${action.actionName}');
                  controller.saveActivity(ActivityEntity(
                    day: DateTime.now().day,
                    actionId: action.actionId!,
                    actionName: '',
                    startOfActivity: DateTime.now(),
                  ));
                  controller.isStarted.value = true;
                  controller.activeAction.value = action.actionName;
                  controller.currentActivity.value = ActivityEntity(
                      day: DateTime.now().day, actionId: 0, startOfActivity: DateTime.now(), actionName: action.actionName);
                  triggerTimer();
                }, builder: (context, _, __) {
                  return Container(
                    height: 200,
                    width: 200,
                    child: controller.activeAction.value == " "
                        ? Container(
                            color: Colors.cyan,
                            height: 100,
                            width: 100,
                            child: Center(
                                child: Text(
                                    "${controller.currentActivity.value.actionName} ${controller.isStarted.value}")),
                          )
                        : Container(
                            height: 100,
                            width: 100,
                            child: Center(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'You are currently',
                                  style: const TextStyle(fontSize: 32),
                                ),
                                Text(
                                  "${controller.currentActivity.value.actionName}",
                                  style: const TextStyle(fontSize: 48),
                                ),
                                Text(
                                  'for ${(Duration(seconds: controller.timerValue.value)).toString().split('.')[0].padLeft(8, '0')}',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ],
                            )),
                          ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void triggerTimer() {
    HomeController controller = Get.find();
    controller.timerValue.value = 0;
  }
}
