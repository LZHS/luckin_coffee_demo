part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginShowHint extends LoginState {}

class LoginChangPhoneArea extends LoginState {
  final String phoneArea;

  LoginChangPhoneArea(this.phoneArea);
}
