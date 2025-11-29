import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dream_home/feature/customer_profile/data/repo/image_picker/image_picker_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../core/network/error/failure.dart';

class ImagePickerRepoImpl implements ImagePickerRepo {
  @override
  Future<Either<Failure, String>> image({required File image}) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;

      if (user == null) {
        return Left(ServerFailure("User not logged in"));
      }

      await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
        "profile_picture": image.path,
      }, SetOptions(merge: true));

      log("image added to Firestore");

      return Right("Image saved to Firestore successfully");
    } on FirebaseAuthException catch (e) {
      // final message = getFriendlyErrorMessage(e.code);
      log("Error: ${e.toString()}");
      return Left(ServerFailure(e.toString()));
    }
  }
}
