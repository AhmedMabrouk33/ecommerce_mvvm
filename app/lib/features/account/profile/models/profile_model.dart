// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileModel {
  final int id;
  String userName;
  String userEmail;
  String userPassword;
  String userImage;

  ProfileModel({
    required this.id,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.userImage,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id']??'',
      userName: json['userName']??'',
      userEmail: json['userEmail']??'',
      userPassword: json['userPassword']??'',
      userImage: json['userImage'],
    );
  }
}
