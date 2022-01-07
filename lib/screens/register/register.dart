import 'package:flutter/material.dart';
import 'package:login/screens/register/components/body.dart';
import 'package:login/service/auth/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key, required this.authService}) : super(key: key);
  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        authService: authService,
      ),
    );
  }
}
