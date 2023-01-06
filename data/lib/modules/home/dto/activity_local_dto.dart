import 'package:data/core/db/db.dart';

class ActivityLocalDTO {
  final int? id;
  final int actionId;
  final int day;
  final DateTime startOfActivity;
  final DateTime endOfActivity;

  ActivityLocalDTO({
    this.id,
    required this.day,
    required this.endOfActivity,
    required this.startOfActivity,
    required this.actionId,
  });
}
