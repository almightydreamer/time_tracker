import 'dart:async';
import 'package:domain/modules/home/action/entity/action_entity.dart';
import 'package:domain/modules/home/action/usecase/get_actions_usecase.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class HomeController extends GetxController {
  GetActionsUseCase getActionsUseCase = GetIt.instance.get<GetActionsUseCase>();

  RxList<ActionEntity> action =RxList();

  Future<void> getAction(List<ActionEntity> list) async {
    var response = getActionsUseCase.call();
    response.listen((event) {
      event.fold((left) => null, (right) => action.value = right);
    });
  }
}
