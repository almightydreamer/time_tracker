class ExercisesApiDTO {
  final int? id;
  final String? image;
  final String title;
  final int plan;
  final int duration;
  final int burnCalories;

  const ExercisesApiDTO(
      {this.id,
        this.image,
        required this.title,
        required this.plan,
        required this.duration,
        required this.burnCalories});

  static ExercisesApiDTO fromJson(json) => ExercisesApiDTO(
    id: json['id'],
    image: json['image'],
    title: json['title'],
    plan: json['plan'],
    duration: json['duration'],
    burnCalories: json['burn_calories'],
  );
}
