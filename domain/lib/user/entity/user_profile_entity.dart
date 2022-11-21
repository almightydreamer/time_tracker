class UserProfileEntity {
  final int id;
  final String fullName;
  final String emailAddress;
  final String? phoneNumber;
  final String? profilePicture;

  const UserProfileEntity({required this.id,
    required this.fullName,
    required this.emailAddress,
    this.phoneNumber,
    this.profilePicture});
}