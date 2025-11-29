import 'dart:io';

abstract class ImagePickerState {}

class ImagePickerInitialState extends ImagePickerState {}

class ImagePickerSuccessState extends ImagePickerState {
  final File image;

  ImagePickerSuccessState(this.image);
}

final class UploadImageLoadingState extends ImagePickerState {}

final class UploadImageSuccessState extends ImagePickerState {
  final String message;

  UploadImageSuccessState(this.message);
}

final class UploadImageFailureState extends ImagePickerState {
  final String message;

  UploadImageFailureState(this.message);
}
