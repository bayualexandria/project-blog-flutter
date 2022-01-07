import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login/bloc/authentication_bloc.dart';
import 'package:login/service/auth/auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
      {required AuthService authService,
      required AuthenticationBloc authenticationBloc})
      : _authService = authService,
        _authenticationBloc = authenticationBloc,
        super(LoginInitial()) {
    on<LoginEvent>(_loginPressed);
  }

  final AuthService _authService;
  final AuthenticationBloc _authenticationBloc;

  _loginPressed(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginButtonPressed) {
      emit(LoginLoading());
      try {
        final token = await _authService.login(event.email, event.password);
        _authenticationBloc.add(LoggedIn(token: token));
        emit(LoginInitial());
      } catch (error) {
        print('pesan error = $error');
        emit(LoginFailure(error: error.toString()));
      }
    }
  }
}
