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
  bool isStarted = false;
  String activeAction = " ";

  void triggerTimer() {
    print("timer is started");
  }

  @override
  void initState() {
    Get.put(HomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    HomeController controller = Get.find();
    //controller.saveActions();
    controller.getActions();
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 50,
                      width: 150,
                      child: Draggable(
                        data: "${controller.actions[index].name}",
                        childWhenDragging:
                            Text("${controller.actions[index].name}"),
                        feedback: Text("${controller.actions[index].name}"),
                        child: Text("${controller.actions[index].name}"),
                      ),
                    );
                  },
                  itemCount: controller.actions.length,
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: DragTarget<String>(
                  onAccept: (String active) {
                    setState(() {
                      isStarted = true;
                      activeAction = active;
                    });
                    triggerTimer();
                  },
                  builder: (context, _, __) {
                    return Container(
                      color: Colors.pinkAccent,
                      height: 200,
                      width: 200,
                      child: activeAction == " "
                          ? Container(
                              color: Colors.cyan,
                              height: 100,
                              width: 100,
                              child: Text("$activeAction $isStarted"),
                            )
                          : Container(
                              color: Colors.amber,
                              height: 100,
                              width: 100,
                              child: Text("$activeAction $isStarted"),
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
