import 'dart:developer';
import 'dart:io';
import 'package:dream_home/feature/customer_profile/data/repo/image_picker/image_picker_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  final ImagePickerRepo _repo;
  ImagePickerCubit(this._repo) : super(ImagePickerInitialState());

  ImagePicker imagePick = ImagePicker();
  File? image;
  Future<void> imagePicker(ImageSource source) async {
    try {
      final pick = await imagePick.pickImage(source: source);
      if (pick != null) {
        image = File(pick.path);
        await uploadImage(image: image!);
        emit(ImagePickerSuccessState(image!));
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> uploadImage({required File image}) async {
    emit(UploadImageLoadingState());

    final result = await _repo.image(image: image);
    result.fold((f) {
      log(f.message);
      emit(UploadImageFailureState(f.message));
    }, (success) => emit(UploadImageSuccessState(success)));
  }
}
