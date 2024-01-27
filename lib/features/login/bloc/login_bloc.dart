import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial(false, 0)) {
    on<Update>((event, emit) {
      emit(LoginUpdate(event.isFill, event.progress));
    });
  }
}
