import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/authentication_bloc.dart';
import 'package:login/screens/login/bloc/login_bloc.dart';
import 'package:login/screens/login/components/body.dart';
import 'package:login/service/auth/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen(
      {Key? key, required this.authService, required this.authenticationBloc})
      : super(key: key);
  final AuthService authService;
  final AuthenticationBloc authenticationBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              authService: authService);
        },
        child: Body(authService:authService ,),
      ),
    );
  }
}
