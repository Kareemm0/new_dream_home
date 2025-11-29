import 'dart:developer';
import 'package:dream_home/core/cache/user_info_cache.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/repo/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _repo;

  LoginCubit(this._repo) : super(InitialState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obsecureText = false;

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel user = LoginModel();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      final result = await _repo.login(
        email: emailController.text,
        password: passwordController.text,
      );
      result.fold(
        (l) {
          log("Error: $l");
          emit(LoginFailureState(l.message));
        },
        (r) async {
          user = r;
          log("User: $r");

          await saveUserToSharedPreferences(user);

          log("User Name ${user.user?.firstName}");
          emit(LoginSuccessState(user));
        },
      );
    }
  }

  void changeObsecureText() {
    obsecureText = !obsecureText;
    emit(ChangeObsecureTextState());
  }
}
