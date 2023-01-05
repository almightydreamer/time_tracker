import 'package:data/modules/home/dto/api/genre_api_dto.dart';

class MovieDetailsApiDTO {
  //final bool adultRestricted;
  final String? backdropPath;

  //final CollectionApiDTO? belongsToCollection;
  //final int budget;
  final List<GenreApiDTO> genres;

  //final String homepage;
  final int id;

  //final String imbdId;
  //final String originalLanguage;
  //final String originalTitle;
  final String? overview;
  final num popularity;
  final String? posterPath;

  //final List<ProductionCompany> productionCompanies;
  //final List<ProductionCountry> productionCountries;
  final String releaseDate;

  //final int revenue;
  final int? runtime;

  //final List<SpokenLanguage> spokenLanguages;
  //final Status status;
  //final String? tagline;
  final String title;

  //final bool isVideo;
  final num voteAverage;

  //final int voteCount;

  const MovieDetailsApiDTO(
      {required this.id,
      required this.voteAverage,
      required this.title,
      required this.posterPath,
      required this.genres,
      required this.runtime,
      required this.releaseDate,
      required this.popularity,
      required this.overview,
      required this.backdropPath});

  static MovieDetailsApiDTO fromJson(json) {
    List<GenreApiDTO> genres = (json['genres'] as List).map((e) => GenreApiDTO.fromJson(e)).toList();
    return MovieDetailsApiDTO(
        id: json['id'],
        voteAverage: json['vote_average'],
        title: json['title'],
        posterPath: json['poster_path'],
        genres: genres,
        runtime: json['runtime'],
        releaseDate: json['release_date'],
        popularity: json['popularity'],
        overview: json['overview'],
        backdropPath: json['backdrop_path']);
  }
}
