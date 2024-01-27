part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState(this.isFill, this.progress);
  final bool isFill;
  final int progress;
}

class LoginInitial extends LoginState {
  const LoginInitial(super.isFill, super.progress);
}

class LoginUpdate extends LoginState {
  const LoginUpdate(super.isFill, super.progress);
}
