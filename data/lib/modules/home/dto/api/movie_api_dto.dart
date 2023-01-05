
class MovieApiDTO {
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

  const MovieApiDTO({
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

  static MovieApiDTO fromJson(json) {
    List<int> genreIds = List.from(json['genre_ids']);
    return MovieApiDTO(
        id: json['id'],
        title: json['title'],
        originalTitle: json['original_title'],
        originalLanguage: json['original_language'],
        adultRestricted: json['adult'],
        backdropPath: json['backdrop_path'],
        genreIds: genreIds,
        isVideo: json['video'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }
}
