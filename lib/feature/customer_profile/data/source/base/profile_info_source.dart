abstract class ProfileInfoSource {
  Future<Map<String, dynamic>> updateProfileInfo({
    required String userId,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String role,
    String? job,
  });

  Future<Map<String, dynamic>> getProfileInfo({required String userId});
}
