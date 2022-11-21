
import 'package:domain/core/request/token.dart';
import 'package:domain/user/entity/user_login_entity.dart';
import 'package:domain/user/entity/user_register_entity.dart';
import 'package:either_dart/either.dart';

import '../../core/request/response.dart';
import '../entity/user_profile_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserProfileEntity>> getApiUserProfile();
  Future<Either<Failure, UserProfileEntity>> getLocalUserProfile();
  Future<Either<Failure, void>> registerUser(UserRegisterEntity user);
  Future<Either<Failure, Token>> loginUser(UserLoginEntity user);
  void setToken(Token token);
}
