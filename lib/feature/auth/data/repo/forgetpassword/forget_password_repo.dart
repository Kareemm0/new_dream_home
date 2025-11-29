import 'package:dartz/dartz.dart';

import '../../../../../core/network/error/failure.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, String>> forgetPassword({
    required String email,
  });
}
