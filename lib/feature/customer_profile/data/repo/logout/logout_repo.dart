import 'package:dartz/dartz.dart';

import '../../../../../core/network/error/failure.dart';

abstract class LogoutRepo {
  Future<Either<Failure, String>> logout();

  Future<Either<Failure, String>> deleteAccount();

  Future<Either<Failure, String>> phoneNumer({
    required String phoneNumer,
  });

  Future<Either<Failure, String>> job({required String job});
}
