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

class StatisticController extends GetxController {
  RxList<ActionEntity> actions = RxList();
  RxList<ActivityEntity> activities = RxList();

  final _saveActivityUseCase = GetIt.instance.get<SaveActivityUseCase>();
  final _getActionsUseCase = GetIt.instance.get<GetActionsUseCase>();
  final _getActivitiesUseCase = GetIt.instance.get<GetActivitiesUseCase>();

  RxBool isStarted = false.obs;
  RxString activeAction = ''.obs;
  Rx<ActivityEntity> currentActivity = ActivityEntity(day: 0, actionId: 0, startOfActivity: DateTime.now()).obs;


  final ActivityEntity activity = ActivityEntity(
    day: DateTime.now().day,
    actionId: 1,
    endOfActivity: DateTime.now(),
    startOfActivity: DateTime.now(),
  );


  Future<void> getActions() async {
    print('getActions');
    var response = _getActionsUseCase.call();
    response.listen((event) {
      event.fold((l) => null, (r) => actions.value = r);
    });
  }

  Future<void> getActivities(int day) async {
    print('getActions');
    var response = _getActivitiesUseCase.call( day);
    response.listen((event) {
      event.fold((l) => null, (r) => activities.value = r);
    });
  }


}
