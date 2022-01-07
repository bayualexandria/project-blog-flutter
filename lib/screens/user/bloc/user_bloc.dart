import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login/service/user/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required UserService userService}) : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is ButtonUpdatedUser) {
        emit(UserLoaded());
        final response = await userService.updateUser(event.name);
        return response.data;
      }
    });
  }
}
