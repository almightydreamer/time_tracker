class GoalsLocalDTO {
  final int? id;
  final String? image;
  final String title;
  final String description;
  final int duration;
  final int burnCalories;

  const GoalsLocalDTO(
      {this.id,
        this.image,
        required this.title,
        required this.description,
        required this.duration,
        required this.burnCalories});

  static GoalsLocalDTO fromJson(json) => GoalsLocalDTO(
    id: json['id'],
    image: json['image'],
    title: json['title'],
    description: json['description'],
    duration: json['duration'],
    burnCalories: json['burn_calories'],
  );
}
