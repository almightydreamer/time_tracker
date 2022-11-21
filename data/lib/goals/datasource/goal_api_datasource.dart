import 'package:dio/dio.dart';

import '../../core/api_constants.dart';
import '../../core/request_headers.dart';

class GoalApiDataSource{

  final Dio _dio = Dio();
  var requestHeaders = RequestParameters.requestHeaders;

  Future<Response<dynamic>> getGoalsList(int pageNumber, int pageLimit) async {
    return _dio.post("${ApiConstants.baseUrl}${ApiConstants.goalsEndpoint}?size=$pageLimit&page=$pageNumber",
        options: Options(headers: requestHeaders));
  }

  Future<Response<dynamic>> startGoal(int id) async {
    return _dio.post("${ApiConstants.baseUrl}${ApiConstants.goalsEndpoint}/$id/start-goal",
        options: Options(headers: requestHeaders));
  }
}