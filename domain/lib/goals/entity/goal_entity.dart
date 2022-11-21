class GoalEntity {
  final int? id;
  final String? image;
  final String title;
  final String description;
  final int duration;
  final int burnCalories;

  const GoalEntity({
    this.id,
    this.image,
    required this.title,
    required this.description,
    required this.duration,
    required this.burnCalories,
  });
}
