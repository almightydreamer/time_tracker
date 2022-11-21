import 'dart:io';

import 'package:data/core/request_headers.dart';
import 'package:domain/core/request/response.dart';
import 'package:domain/core/request/token.dart';
import 'package:domain/user/entity/user_login_entity.dart';
import 'package:domain/user/entity/user_profile_entity.dart';
import 'package:domain/user/entity/user_register_entity.dart';
import 'package:domain/user/repository/user_repository.dart';
import 'package:either_dart/either.dart';

import '../datasource/user_api_datasource.dart';
import '../datasource/user_local_data_source.dart';
import '../dto/user_api_dto.dart';
import '../dto/user_local_dto.dart';
import '../mapper/user_mapper.dart';

class UserRepositoryImpl implements UserRepository {
  late UserApiDataSource _apiDataSource;
  late UserLocalDataSource _localDataSource;

  UserRepositoryImpl(
      {required UserApiDataSource userApiDataSource,
      required UserLocalDataSource userLocalDataSource}) {
    _apiDataSource = userApiDataSource;
    _localDataSource = userLocalDataSource;
  }

  @override
  Future<Either<Failure, UserProfileEntity>> getApiUserProfile() async {
    try {
      var response = await _apiDataSource.getUserProfileData();
      if (response.statusCode != HttpStatus.ok) {
        return Left(ApiFailure(response.data, StackTrace.current));
      }
      UserApiDTO userApiDto = UserApiDTO.fromJson(response.data);
      UserProfileEntity entity = UserMapper().mapApiToEntity(userApiDto);

      return Right(entity);
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }

  @override
  Future<Either<Failure, UserProfileEntity>> getLocalUserProfile() async {
    try {
      var data = _localDataSource.db;
      UserLocalDTO userLocalDTO = UserLocalDTO.fromJson(data);
      UserProfileEntity entity = UserMapper().mapLocalToEntity(userLocalDTO);
      return Right(entity);
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }

  @override
  Future<Either<Failure, void>> registerUser(UserRegisterEntity user) async {
    try {
      var response = await _apiDataSource.registerUser(user);
      if (response.statusCode != HttpStatus.created) {
        return Left(ApiFailure(response.data, StackTrace.current));
      }
      return Right(null);
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }

  @override
  Future<Either<Failure, Token>> loginUser(UserLoginEntity user) async {
    try {
      var response = await _apiDataSource.loginUser(user);
      if (response.statusCode != HttpStatus.created) {
        return Left(ApiFailure(response.data, StackTrace.current));
      }

      Token token = Token.fromJson(response.data);

      return Right(token);
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }

  @override
  void setToken(Token token) {
    RequestParameters.requestHeaders['Refresh'] = (token.refresh);
    RequestParameters.requestHeaders['Authorization'] = (token.access);
  }
}
