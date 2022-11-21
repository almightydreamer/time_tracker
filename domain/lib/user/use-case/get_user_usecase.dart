import 'package:either_dart/either.dart';

import '../../core/request/response.dart';
import '../entity/user_profile_entity.dart';
import '../repository/user_repository.dart';

class GetUserProfileUseCase {
  final UserRepository repository;

  GetUserProfileUseCase(this.repository);

  Stream<Either<Failure, UserProfileEntity>> call() async* {
    var dbResponse = await repository.getLocalUserProfile();
    UserProfileEntity? userProfileEntity;
    dbResponse.fold((l) => null, (r) {
      userProfileEntity = r;
    });
    if (userProfileEntity != null) {
      yield Right(userProfileEntity!);
    }
    yield await repository.getApiUserProfile();
  }
}
