import 'package:dream_home/feature/auth/data/repo/forgetpassword/forget_password_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo _repo;
  ForgetPasswordCubit(this._repo) : super(ForgetPasswordInitial());

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> forgetpassword() async {
    if (formKey.currentState!.validate()) {
      emit(ForgetPasswordLoadindState());
      final result = await _repo.forgetPassword(email: emailController.text);
      result.fold(
        (l) => emit(ForgetPasswordFailureState(l.message)),
        (r) => emit(ForgetPasswordSuccessState(r)),
      );
    }
  }
}
