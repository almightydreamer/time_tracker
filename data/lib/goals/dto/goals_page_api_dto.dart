import 'package:data/goals/dto/goals_api_dto.dart';

class GoalsPageApiDTO {

  List<GoalsApiDTO> results;
  int? count;
  String? next;
  String? previous;

  GoalsPageApiDTO({required this.results, this.count, this.next, this.previous});

  static GoalsPageApiDTO fromJson(json) {
    List<GoalsApiDTO> goals =
    (json['results'] as List).map((e) => GoalsApiDTO.fromJson(e)).toList();
    return GoalsPageApiDTO(
        results: goals,
        count: json['count'],
        next: json['next'],
        previous: json['previous']);

  }
}