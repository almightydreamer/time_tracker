import 'package:dio/dio.dart';
import 'package:domain/user/entity/user_login_entity.dart';
import 'package:domain/user/entity/user_register_entity.dart';

import '../../core/api_constants.dart';
import '../../core/request_headers.dart';

final Dio _dio = Dio();

class UserApiDataSource {
  var requestHeaders = RequestParameters.requestHeaders;

  Future<Response<dynamic>> registerUser(UserRegisterEntity userData) async {

    Map<String,dynamic> data = <String, dynamic>{
      'full_name': userData.fullName,
    'email': userData.emailAddress,
    'password': userData.password,
    'phone_number': userData.phoneNumber
    };

    return _dio.post(ApiConstants.registerEndpoint,
        data: data,
        options: Options(headers: requestHeaders));
  }

  Future<Response<dynamic>> loginUser(UserLoginEntity userData) async {

    Map<String,dynamic> data = <String,String>{
      'email': userData.emailAddress,
      'password': userData.password};

    return _dio.post(ApiConstants.loginEndpoint,
        data: data,
        options: Options(headers: RequestParameters.requestHeaders));
  }

  Future<Response<dynamic>> getUserProfileData() async {
    return _dio.get(
      ApiConstants.profileEndpoint,
      options: Options(
        headers: requestHeaders,
      ),
    );
  }
}
