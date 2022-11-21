

import 'exercise_api_dto.dart';

class ExercisesPageApiDTO {

  List<ExercisesApiDTO> results;
  int? count;
  String? next;
  String? previous;

  ExercisesPageApiDTO({required this.results, this.count, this.next, this.previous});

  static ExercisesPageApiDTO fromJson(json) {
    List<ExercisesApiDTO> exercises =
    (json['results'] as List).map((e) => ExercisesApiDTO.fromJson(e)).toList();
    return ExercisesPageApiDTO(
        results: exercises,
        count: json['count'],
        next: json['next'],
        previous: json['previous']);

  }
}