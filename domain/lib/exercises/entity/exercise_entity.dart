class ExerciseEntity {
  final int? id;
  final String? image;
  final String title;
  final int plan;
  final int duration;
  final int burnCalories;

  const ExerciseEntity({
    this.id,
    this.image,
    required this.title,
    required this.plan,
    required this.duration,
    required this.burnCalories,
  });
}
