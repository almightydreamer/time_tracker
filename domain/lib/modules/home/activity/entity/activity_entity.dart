class ActivityEntity {
  final int id;
  final int activityId;
  final DateTime startOfActivity;
  final DateTime endOfActivity;

  const ActivityEntity({
    required this.id,
    required this.activityId,
    required this.endOfActivity,
    required this.startOfActivity,
  });
}
