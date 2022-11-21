class UserApiDTO {
  final int id;
  final String fullName;
  final String emailAddress;
  final String? phoneNumber;
  final String? profilePicture;

  const UserApiDTO(
      {required this.id,
        required this.fullName,
        required this.emailAddress,
        this.phoneNumber,
        this.profilePicture});

  static UserApiDTO fromJson(json) =>
      UserApiDTO(
        id: json['id'],
        fullName: json['full_name'],
        emailAddress: json['email'],
        phoneNumber: json['phone_number'],
        profilePicture: json['profile_picture'],
      );
}

