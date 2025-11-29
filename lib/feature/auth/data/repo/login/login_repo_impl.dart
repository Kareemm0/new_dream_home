import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/login_model.dart';
import 'package:dream_home/feature/auth/data/source/base/auth_source.dart';
import 'package:dream_home/feature/auth/domin/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/network/error/failure.dart';

class LoginRepoImpl implements AuthRepo {
  final AuthSource _source;

  LoginRepoImpl(this._source);
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _source.login(email: email, password: password);
      if (response['message'] == "Check your email and password") {
        return Left(ServerFailure(response['message']));
      }
      return Right(LoginModel.fromJson(response));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginModel>> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phone,
      required String type,
      required String job}) async {
    try {
      final response = await _source.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phone: phone,
        type: type,
        job: job,
      );
      if (response['message'] != "User created successfully") {
        return Left(ServerFailure(response['message']));
      }
      return Right(LoginModel.fromJson(response));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
