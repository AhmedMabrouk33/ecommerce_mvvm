import './profile_repository.dart';

class ProfileTest implements ProfileRepository {
  const ProfileTest();

  @override
  Future<String> uploadNewEmail({
    required String userId,
    required String newEmail,
  }) async {
    await Future.delayed(const Duration(seconds: 20));
    return newEmail;
  }

  @override
  Future<String> uploadNewImage({
    required String userId,
    required String newImage,
  }) async {
    await Future.delayed(const Duration(seconds: 20));
    return throw ('Can\'t upload image in test mode');
  }

  @override
  Future<String> uploadNewName({
    required String userId,
    required String newName,
  }) async {
    await Future.delayed(const Duration(seconds: 20));
    return newName;
  }

  @override
  Future<String> uploadNewPassword({
    required String userId,
    required String newPassword,
    required String oldPassword,
  }) async {
    await Future.delayed(const Duration(seconds: 20));
    return newPassword;
  }
}
