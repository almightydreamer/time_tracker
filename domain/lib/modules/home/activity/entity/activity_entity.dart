class ActivityEntity {
  final int? id;
  final int actionId;
  final int day;
  final DateTime startOfActivity;
  final DateTime endOfActivity;

  const ActivityEntity({
    this.id,
    required this.day,
    required this.actionId,
    required this.endOfActivity,
    required this.startOfActivity,
  });
}
