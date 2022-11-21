class GoalsApiDTO {
  final int? id;
  final String? image;
  final String title;
  final String description;
  final int duration;
  final int burnCalories;

  const GoalsApiDTO(
      {this.id,
      this.image,
      required this.title,
      required this.description,
      required this.duration,
      required this.burnCalories});

  static GoalsApiDTO fromJson(json) => GoalsApiDTO(
        id: json['id'],
        image: json['image'],
        title: json['title'],
        description: json['plan'],
        duration: json['duration'],
        burnCalories: json['burn_calories'],
      );
}
