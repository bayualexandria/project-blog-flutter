part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String email, password;

  const LoginButtonPressed({required this.email, required this.password});

  @override
  String toString() => 'LoginButtonPressed {email:$email,password:$password}';
}

class LoginFailure extends LoginState {
  final Object error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure {$error}';
}
