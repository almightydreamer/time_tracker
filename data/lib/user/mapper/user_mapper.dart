import 'package:domain/user/entity/user_profile_entity.dart';

import '../dto/user_api_dto.dart';
import '../dto/user_local_dto.dart';

class UserMapper {
  UserProfileEntity mapApiToEntity(UserApiDTO input) {
    return UserProfileEntity(
        id: input.id,
        fullName: input.fullName,
        emailAddress: input.emailAddress,
        phoneNumber: input.phoneNumber,
        profilePicture: input.profilePicture);
  }

  UserProfileEntity mapLocalToEntity(UserLocalDTO input) {
    return UserProfileEntity(
        id: input.id,
        fullName: input.fullName,
        emailAddress: input.emailAddress,
        phoneNumber: input.phoneNumber,
        profilePicture: input.profilePicture);
  }



}

