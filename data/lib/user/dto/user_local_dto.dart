class UserLocalDTO {
  final int id;
  final String fullName;
  final String emailAddress;
  final String? phoneNumber;
  final String? profilePicture;

  const UserLocalDTO(
      {required this.id,
        required this.fullName,
        required this.emailAddress,
        this.phoneNumber,
        this.profilePicture});

  static UserLocalDTO fromJson(json) =>
      UserLocalDTO(
        id: json['id'],
        fullName: json['full_name'],
        emailAddress: json['email'],
        phoneNumber: json['phone_number'],
        profilePicture: json['profile_picture'],
      );
}

