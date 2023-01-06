import 'dart:async';
import 'package:domain/modules/home/action/entity/action_entity.dart';
import 'package:domain/modules/home/action/usecase/get_actions_usecase.dart';
import 'package:domain/modules/home/action/usecase/save_actions_usecase.dart';
import 'package:domain/modules/home/activity/entity/activity_entity.dart';
import 'package:domain/modules/home/activity/usecase/get_activities_usecase.dart';
import 'package:domain/modules/home/activity/usecase/save_activity_usecase.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class HomeController extends GetxController {
  final _saveActionsUseCase = GetIt.instance.get<SaveActionsUseCase>();
  final _saveActivityUseCase = GetIt.instance.get<SaveActivityUseCase>();
  final _getActionsUseCase = GetIt.instance.get<GetActionsUseCase>();
  final _getActivitiesUseCase = GetIt.instance.get<GetActivitiesUseCase>();

  final List<ActionEntity> actionList = [
    ActionEntity(name: 'Smoking'),
    ActionEntity(name: 'Drinking'),
    ActionEntity(name: 'Eating'),
    ActionEntity(name: 'Coding'),
  ];

  final ActivityEntity activity = ActivityEntity(
    day: DateTime.now().day,
    actionId: 1,
    endOfActivity: DateTime.now(),
    startOfActivity: DateTime.now(),
  );

  Future<void> testActions() async {
    var response = await _saveActionsUseCase(actionList);
    response.fold((l) {
      print('save left');
    }, (r) {
      print('save right');
    });

    var actionsStream = _getActionsUseCase();
    await for (var event in actionsStream) {
      event.fold((l) {
        print('get left');
      }, (r) => r.forEach(print));
    }
  }

  Future<void> testActivities() async {
    var response = await _saveActivityUseCase(activity);
    response.fold((l) {
      print('save left');
    }, (r) {
      print('save right');
    });

    var actionsStream = _getActivitiesUseCase(DateTime.now().day);
    await for (var event in actionsStream) {
      event.fold((l) {
        print('get left');
      }, (r) => r.forEach(print));
    }
  }
}
