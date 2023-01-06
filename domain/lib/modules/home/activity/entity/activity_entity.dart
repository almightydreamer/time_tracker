class ActivityEntity {
  final int? id;
  final int actionId;
  final String? actionName;
  final int day;
  final DateTime startOfActivity;
  final DateTime? endOfActivity;

  const ActivityEntity({
    this.id,
    required this.day,
    required this.actionId,
    this.actionName,
    this.endOfActivity,
    required this.startOfActivity,
  });
}
