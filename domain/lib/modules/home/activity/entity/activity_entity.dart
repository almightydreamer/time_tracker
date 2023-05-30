import 'package:domain/modules/home/action/entity/action_entity.dart';

///
/// TMPS Project
///
/// This is an example of factory method
///

class ActivityEntity extends ActionEntity {
  final int? id;
  final int actionId;
  final String actionName;
  final int day;
  final DateTime startOfActivity;
  final DateTime? endOfActivity;

   ActivityEntity({
    this.id,
    required this.day,
    required this.actionId,
    required this.actionName,
    this.endOfActivity,
    required this.startOfActivity,
  }) : super(id: actionId, name: actionName);
}
