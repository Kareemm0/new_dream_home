import 'package:dartz/dartz.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/login_model.dart';

import '../../../../core/network/error/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, LoginModel>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String type,
    required String job,
  });
}
