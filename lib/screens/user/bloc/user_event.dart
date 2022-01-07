part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class ButtonUpdatedUser extends UserEvent {
  final String name;

  const ButtonUpdatedUser({required this.name});

  @override
  String toString() {
    return 'ButtonUpdatedUser{name:$name}';
  }
}
