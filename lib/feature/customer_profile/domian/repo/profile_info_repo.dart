import 'package:dartz/dartz.dart';
import 'package:dream_home/core/network/error/failure.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/user.dart';
import 'package:dream_home/feature/customer_profile/data/model/profile_info_model/profile_info_model.dart';

abstract class ProfileInfoRepo {
  Future<Either<Failure, User>> updateProfileInfo({
    required String userId,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String role,
    String? job,
  });
  Future<Either<Failure, ProfileInfoModel>> getProfileInfo({
    required String userId,
  });
}
