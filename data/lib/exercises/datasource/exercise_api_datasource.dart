import 'package:dio/dio.dart';

import '../../core/api_constants.dart';
import '../../core/request_headers.dart';

class ExerciseApiDataSource{

  final Dio _dio = Dio();
  var requestHeaders = RequestParameters.requestHeaders;

  Future<Response<dynamic>> getExercisesList(int pageNumber, int pageLimit) async {
    return _dio.post("${ApiConstants.baseUrl}${ApiConstants.exercisesEndpoint}?size=$pageLimit&page=$pageNumber",
        options: Options(headers: requestHeaders));
  }

  // Future<Response<dynamic>> startExercise(int id) async {
  //   return _dio.post("${ApiConstants.baseUrl}${ApiConstants.exercisesEndpoint}/$id/start-goal",
  //       options: Options(headers: requestHeaders));
  // }
}