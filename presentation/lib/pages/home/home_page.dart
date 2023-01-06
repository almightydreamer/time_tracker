import 'package:domain/modules/home/action/entity/action_entity.dart';
import 'package:domain/modules/home/activity/entity/activity_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Get.put(HomeController());
    HomeController controller = Get.find();
    controller.getActions();
    controller.resumeActivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    HomeController controller = Get.find();
    //controller.saveActions();
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 1,
                      color: Colors.black.withOpacity(0.2),
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black)),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              child: Draggable(
                                data: controller.actions[index],
                                childWhenDragging: Text("${controller.actions[index].name}"),
                                feedback: Text("${controller.actions[index].name}"),
                                child: Text("${controller.actions[index].name}"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: controller.actions.length,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(6), topLeft: Radius.circular(6))),
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: DragTarget<ActionEntity>(onAccept: (ActionEntity action) {
                print('${action.name}');
                controller.saveActivity(ActivityEntity(
                  day: DateTime.now().day,
                  actionId: action.id!,
                  startOfActivity: DateTime.now(),
                ));
                controller.isStarted.value = true;
                controller.activeAction.value = action.name;
                controller.currentActivity.value =
                    ActivityEntity(day: DateTime.now().day, actionId: 0, startOfActivity: DateTime.now());
                triggerTimer();
              }, builder: (context, _, __) {
                return Obx(() => Container(
                      color: Colors.pinkAccent,
                      height: 200,
                      width: 200,
                      child: controller.activeAction.value == " "
                          ? Container(
                              color: Colors.cyan,
                              height: 100,
                              width: 100,
                              child: Text("${controller.currentActivity.value.actionName} ${controller.isStarted.value}"),
                            )
                          : Container(
                              color: Colors.amber,
                              height: 100,
                              width: 100,
                              child: Text("${controller.currentActivity.value.actionName} ${controller.isStarted.value}"),
                            ),
                    ));
              }),
            ),
          ],
        ),
      ),
    );
  }

  void triggerTimer() {
    print("timer is started");
  }
}
