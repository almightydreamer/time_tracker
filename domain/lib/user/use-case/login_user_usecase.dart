import 'package:domain/core/request/response.dart';
import 'package:domain/user/repository/user_repository.dart';
import 'package:either_dart/either.dart';

import '../entity/user_login_entity.dart';

class LoginUserUseCase {
  final UserRepository repository;

  LoginUserUseCase(this.repository);

  Future<Either<Failure, void>> call(UserLoginEntity user) async {
    var response = await repository.loginUser(user);


    return response.fold((l) => Left(l), (r) {
      repository.setToken(r);
      return Right(null);
    });
  }
}
