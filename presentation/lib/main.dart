import 'package:domain/modules/home/action/entity/action_entity.dart';
import 'package:domain/modules/home/action/usecase/get_actions_usecase.dart';
import 'package:domain/modules/home/action/usecase/save_actions_usecase.dart';
import 'package:domain/modules/home/activity/usecase/get_activities_usecase.dart';
import 'package:domain/modules/home/activity/usecase/save_activity_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dependency_injection/dependency_injection.dart' as di;
import 'package:get_it/get_it.dart';
import 'package:presentation/pages/home/home_page.dart';

void main() {
  di.init();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _saveActionsUseCase = GetIt.instance.get<SaveActionsUseCase>();
    final _saveActivitiesUseCase = GetIt.instance.get<SaveActivityUseCase>();
    final _getActionsUseCase = GetIt.instance.get<GetActionsUseCase>();
    final _getActivitiesUseCase = GetIt.instance.get<GetActivitiesUseCase>();

    final List<ActionEntity> list = [
      ActionEntity(name: 'Smoking'),
      ActionEntity(name: 'Drinking'),
      ActionEntity(name: 'Eating'),
      ActionEntity(name: 'Coding'),
    ];

    _saveActionsUseCase(list);

    var actionsStream = _getActionsUseCase();
    await for(var event in actionsStream){
      event.fold((left) => null, (right) => null)
    }

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          canvasColor: Colors.transparent,
        ),
        home: const HomePage());
  }
}
