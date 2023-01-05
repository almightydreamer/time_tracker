import 'movie_api_dto.dart';

class MoviePageApiDTO {
  final int totalPages;
  final int totalResults;
  final int currentPage;
  final List<MovieApiDTO> movies;

  const MoviePageApiDTO({
    required this.totalPages,
    required this.totalResults,
    required this.currentPage,
    required this.movies,
  });

  static MoviePageApiDTO fromJson(json) {
    print('results');
    try {
      List<MovieApiDTO> movies = (json['results'] as List).map((e) => MovieApiDTO.fromJson(e)).toList();
    }catch(e){print(e);};
    print('results');
    List<MovieApiDTO> movies = (json['results'] as List).map((e) => MovieApiDTO.fromJson(e)).toList();

    return MoviePageApiDTO(
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
        currentPage: json['current_page'],
        movies: movies);
  }
}
