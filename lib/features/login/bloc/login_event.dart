part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

/// Notifies bloc to increment state.
class Update extends LoginEvent {
  final bool isFill;
  final int progress;

  Update(this.isFill, this.progress);
}
