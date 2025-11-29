part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final LoginModel user;
  const RegisterSuccess(this.user);

  @override
  List<Object> get props => [user];
}

final class RegisterError extends RegisterState {
  final String message;
  const RegisterError(this.message);

  @override
  List<Object> get props => [message];
}

class ChangePasswordObsecureTextState extends RegisterState {}

class ChangeConfirmPasswordObsecureTextState extends RegisterState {}

final class ImagePickerSuccessState extends RegisterState {
  final File image;

  const ImagePickerSuccessState(this.image);

  @override
  List<Object> get props => [image];
}
