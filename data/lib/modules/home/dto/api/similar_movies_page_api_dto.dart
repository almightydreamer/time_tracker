import 'package:data/modules/home/dto/api/similar_movie_api_dto.dart';


class SimilarMoviesPageApiDTO {
  final int totalPages;
  final int totalResults;
  final int currentPage;
  final List<SimilarMovieApiDTO> movies;

  const SimilarMoviesPageApiDTO({
    required this.totalPages,
    required this.totalResults,
    required this.currentPage,
    required this.movies,
  });

  static SimilarMoviesPageApiDTO fromJson(json) {
    print('results');
    List<SimilarMovieApiDTO> movies = (json['results'] as List).map((e) => SimilarMovieApiDTO.fromJson(e)).toList();
    return SimilarMoviesPageApiDTO(
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
        currentPage: json['current_page'],
        movies: movies);
  }
}
