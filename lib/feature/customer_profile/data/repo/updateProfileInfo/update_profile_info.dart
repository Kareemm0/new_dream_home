import 'package:dartz/dartz.dart';
import 'package:dream_home/core/network/error/failure.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/user.dart';
import 'package:dream_home/feature/customer_profile/data/model/profile_info_model/profile_info_model.dart';
import 'package:dream_home/feature/customer_profile/data/source/base/profile_info_source.dart';
import 'package:dream_home/feature/customer_profile/domian/repo/profile_info_repo.dart';

class UpdateProfileInfo implements ProfileInfoRepo {
  final ProfileInfoSource _source;

  UpdateProfileInfo(this._source);
  @override
  Future<Either<Failure, User>> updateProfileInfo(
      {required String userId,
      required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String role,
      String? job}) async {
    try {
      final response = await _source.updateProfileInfo(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        role: role,
        job: job,
      );
      if (response['_id'] != null) {
        return Right(User.fromJson(response));
      } else {
        return Left(ServerFailure(response['message']));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileInfoModel>> getProfileInfo(
      {required String userId}) async {
    try {
      final response = await _source.getProfileInfo(userId: userId);
      if (response['user'] != null) {
        return Right(ProfileInfoModel.fromJson(response));
      } else {
        return Left(ServerFailure(response['message']));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
