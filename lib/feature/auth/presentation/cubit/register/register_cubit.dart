import 'dart:developer';
import 'dart:io';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../domin/repo/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo _repo;
  RegisterCubit(this._repo) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  LoginModel user = LoginModel();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool passwordObsecureText = false;
  bool confirmPasswordObsecureText = false;

  ImagePicker picker = ImagePicker();
  File? profileImage;

  String selectedItem = "";
  String selectedJob = "";
  List<String> items = ["employee", "customer"];
  List<String> images = [AppImages.craft2, AppImages.per2];

  void changepasswordObsecureText() {
    passwordObsecureText = !passwordObsecureText;

    emit(ChangePasswordObsecureTextState());
  }

  void changeconfirmPasswordObsecureText() {
    confirmPasswordObsecureText = !confirmPasswordObsecureText;

    emit(ChangeConfirmPasswordObsecureTextState());
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      final result = await _repo.register(
        firstName: userNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
        type: selectedItem,
        job: selectedJob,
      );
      result.fold(
        (l) {
          log("Error: $l");
          emit(RegisterError(l.message));
        },
        (r) async {
          user = r;
          // await saveUserToSharedPreferences(user);
          // log("User: ${r.user?.firstName}");
          // log("User Name ${user.user?.firstName}");
          // log("User ${user.user}");
          emit(RegisterSuccess(r));
        },
      );
    }
  }

  Future<void> logoPicker(ImageSource source) async {
    try {
      final pick = await picker.pickImage(source: source);
      if (pick != null) {
        profileImage = File(pick.path);
        emit(ImagePickerSuccessState(profileImage!));
      }
    } catch (e) {
      rethrow;
    }
  }
}
