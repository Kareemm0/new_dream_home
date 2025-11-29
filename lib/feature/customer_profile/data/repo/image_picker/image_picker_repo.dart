import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../../core/network/error/failure.dart';

abstract class ImagePickerRepo {
  Future<Either<Failure, String>> image({required File image});
}
