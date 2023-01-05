class SimilarMovieEntity {
  final int id;
  final String title;
  final String originalTitle;
  final String originalLanguage;
  final String? posterPath;
  final bool adultRestricted;
  final String overview;
  final String releaseDate;
  final List<int> genreIds;
  final String? backdropPath;
  final double popularity;
  final int voteCount;
  final bool isVideo;
  final num voteAverage;

  const SimilarMovieEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.originalLanguage,
    required this.adultRestricted,
    this.backdropPath,
    required this.genreIds,
    required this.isVideo,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });
}
