import 'dart:async';
import 'package:domain/modules/home/action/entity/action_entity.dart';
import 'package:domain/modules/home/action/usecase/get_actions_usecase.dart';
import 'package:domain/modules/home/action/usecase/save_actions_usecase.dart';
import 'package:domain/modules/home/activity/entity/activity_entity.dart';
import 'package:domain/modules/home/activity/usecase/get_activities_usecase.dart';
import 'package:domain/modules/home/activity/usecase/resume_activity_usecase.dart';
import 'package:domain/modules/home/activity/usecase/save_activity_usecase.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class HomeController extends GetxController {
  RxList<ActionEntity> actions = RxList();

  final _saveActionsUseCase = GetIt.instance.get<SaveActionsUseCase>();
  final _saveActivityUseCase = GetIt.instance.get<SaveActivityUseCase>();
  final _getActionsUseCase = GetIt.instance.get<GetActionsUseCase>();
  final _getActivitiesUseCase = GetIt.instance.get<GetActivitiesUseCase>();
  final _getLastActivityUseCase = GetIt.instance.get<GetLastActivityUseCase>();

  RxBool isStarted = false.obs;
  RxString activeAction = ''.obs;
  Rx<ActivityEntity> currentActivity = ActivityEntity(day: 0, actionId: 0, startOfActivity: DateTime.now()).obs;

  final List<ActionEntity> actionList = [
    const ActionEntity(name: 'Smoking'),
    const ActionEntity(name: 'Drinking'),
    const ActionEntity(name: 'Eating'),
    const ActionEntity(name: 'Coding'),
  ];

  final ActivityEntity activity = ActivityEntity(
    day: DateTime.now().day,
    actionId: 1,
    endOfActivity: DateTime.now(),
    startOfActivity: DateTime.now(),
  );

  Future<void> saveActions() async {
    print('saveActions');
    var response = await _saveActionsUseCase(actionList);
    response.fold((l) {}, (r) {});
  }

  Future<void> getActions() async {
    print('getActions');
    var response = _getActionsUseCase.call();
    response.listen((event) {
      event.fold((l) => null, (r) => actions.value = r);
    });
  }

  Future<void> resumeActivity() async {
    print('1');
    var response = await _getLastActivityUseCase.call();
    print('2');
    response.fold((l) => null, (r) {
      if (r.endOfActivity == null) {
        print('3');
        currentActivity.value = r;
      }
    });
  }

  Future<void> saveActivity(ActivityEntity entity) async {
    var response = await _saveActivityUseCase.call(entity);
  }

  Future<void> testActivities() async {
    print('testActivities');
    var response = await _saveActivityUseCase(activity);
    response.fold((l) {}, (r) {});

    var actionsStream = _getActivitiesUseCase(DateTime.now().day);
    await for (var event in actionsStream) {
      event.fold((l) {}, (r) => r.forEach(print));
    }
  }
}
