part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class Authorized extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String token;

  const LoggedIn({required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoggedIn {$token}';
}

class LoggedMessage extends AuthenticationEvent {
  final String message;

  const LoggedMessage({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'LoggedMessage {$message}';
}

class LoggedOut extends AuthenticationEvent {}
