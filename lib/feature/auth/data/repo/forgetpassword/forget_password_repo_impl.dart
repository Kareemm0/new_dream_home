import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dream_home/feature/auth/data/repo/forgetpassword/forget_password_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/network/error/failure.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  @override
  Future<Either<Failure, String>> forgetPassword({
    required String email,
  }) async {
    final auth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance;
    try {
      await auth.sendPasswordResetEmail(email: email);
      final userQuery = await firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      if (userQuery.docs.isNotEmpty) {
        final userId = userQuery.docs.first.id;
        await firestore.collection('users').doc(userId).update({
          'passwordResetRequested': true,
          'resetRequestedAt': FieldValue.serverTimestamp(),
        });
      }
      return Right("Password reset link sent to your email.");
    } on FirebaseAuthException catch (e) {
      // final String message = getFriendlyErrorMessage(e.code);
      return Left(ServerFailure(e.toString()));
    }
  }
}
