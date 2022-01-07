import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login/service/auth/auth_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required AuthService authService})
      : _authService = authService,
        super(AuthenticationUninitialized()) {
    on<AuthenticationEvent>(_authenticationAction);
  }

  final AuthService _authService;

  _authenticationAction(
      AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    if (event is AppStarted) {
      emit(AuthenticationUninitialized());
      final bool hasToken = await _authService.hasToken();

      if (hasToken) {
        emit(AuthenticationAuthenticated());
      } else {
        emit(AuthenticationUnauthenticated());
      }
    }

    if (event is LoggedIn) {
      emit(AuthenticationLoading());
      await _authService.persisteToken(event.token);
      emit(AuthenticationAuthenticated());
    }

    if (event is LoggedMessage) {
      emit(AuthenticationLoading());
      await _authService.persisteToken(event.message);
      emit(AuthenticationUnauthenticated());
    }

    if (event is LoggedOut) {
      final String token = await _authService.token();
      print(token);
      emit(AuthenticationLoading());
      await _authService.logout(token);
      emit(AuthenticationUnauthenticated());
    }
  }
}
