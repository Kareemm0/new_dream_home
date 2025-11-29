part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoadindState extends ForgetPasswordState {}

final class ForgetPasswordSuccessState extends ForgetPasswordState {
  final String message;

  const ForgetPasswordSuccessState(this.message);
  @override
  List<Object> get props => [message];
}

final class ForgetPasswordFailureState extends ForgetPasswordState {
  final String message;

  const ForgetPasswordFailureState(this.message);
  @override
  List<Object> get props => [message];
}
