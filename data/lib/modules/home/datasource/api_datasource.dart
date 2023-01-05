import 'package:data/core/api_constants.dart';
import 'package:data/core/request_headers.dart';
import 'package:dio/dio.dart';

class ApiDataSource {
  final Dio _dio = Dio();
  var requestHeaders = RequestParameters.requestHeaders;

  Future<Response<dynamic>> getGenres() async {
    return _dio.get("${ApiConstants.genresUrl}/list?api_key=${RequestParameters.apiKey}");
  }

  // https://api.themoviedb.org/3/genre/movie/list?api_key=<<api_key>>&language=en-US
  Future<Response<dynamic>> getMovieList(int pageNumber, List<int>? genres) async {
    if (genres != null && genres.isEmpty) {
      return _dio.get("${ApiConstants.discoverUrl}/movie?api_key=${RequestParameters.apiKey}&page=$pageNumber");
    }
    else {
      String genresQuery = genres!.first.toString();
      if (genres.length > 1) {
        for (var genre in genres) {
          genresQuery += '+$genre';
        }
      }
      return _dio.get("${ApiConstants.discoverUrl}/movie?api_key=${RequestParameters
          .apiKey}&page=$pageNumber&with_genres=$genresQuery");
    }
  }
  Future<Response<dynamic>> getMovieDetails(int movieId) async {
    return _dio.get("${ApiConstants.movieUrl}/$movieId?api_key=${RequestParameters.apiKey}");
  }

  Future<Response<dynamic>> searchMovie(String query) async {
    return _dio.get("${ApiConstants.searchUrl}/movie?api_key=${RequestParameters.apiKey}&query=$query");
  }

  Future<Response<dynamic>> getSimilarMovies(int movieId) async {
    return _dio.get("${ApiConstants.movieUrl}/$movieId/similar?api_key=${RequestParameters.apiKey}");
  }
}
