abstract class ProfileRepository {
  Future<String> uploadNewName({
    required String userId,
    required String newName,
  });
  Future<String> uploadNewEmail({
    required String userId,
    required String newEmail,
  });
  Future<String> uploadNewPassword({
    required String userId,
    required String newPassword,
    required String oldPassword,
  });
  Future<String> uploadNewImage({
    required String userId,
    required String newImage,
  });
}
