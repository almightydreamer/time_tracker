import 'package:domain/core/request/response.dart';
import 'package:domain/user/entity/user_register_entity.dart';
import 'package:domain/user/repository/user_repository.dart';
import 'package:either_dart/either.dart';

class RegisterUserUseCase {
  final UserRepository repository;

  RegisterUserUseCase(this.repository);

  Future<Either<Failure, void>> call(UserRegisterEntity user) async {
    var response = await repository.registerUser(user);
    return response.fold((l) => Left(l), (r) {
      return Right(null);
    });
  }
}
