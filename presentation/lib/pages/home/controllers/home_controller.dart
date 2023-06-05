import 'dart:async';
import 'dart:ffi';
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
  Rx<ActivityEntity> currentActivity = ActivityEntity(day: 0, actionId: 0, startOfActivity: DateTime.now(), actionName: 'Stand-by').obs;
  RxInt timerValue = 0.obs;
  RxBool addingAction = false.obs;
  RxBool savingActivity = false.obs;

  Future<void> saveActions(ActionEntity action) async {
    print('saveActions');
    List<ActionEntity> actions = [];
    actions.add(action);
    var response = await _saveActionsUseCase(actions);
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
        timerValue += DateTime.now().difference(r.startOfActivity).inSeconds;
      }
    });
  }

  void saveActivity(ActivityEntity entity) {
    _saveActivityUseCase.call(entity);
  }
}
