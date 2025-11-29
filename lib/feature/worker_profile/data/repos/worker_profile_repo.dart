import 'package:dartz/dartz.dart';
import '../../../../core/network/error/failure.dart';

abstract class WorkerProfileRepo {
  Future<Either<Failure, String>> logout();

  Future<Either<Failure, String>> deleteAccount();
}
