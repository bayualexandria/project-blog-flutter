import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:login/screens/user/component/body.dart';
import 'package:login/screens/user/component/top_bar.dart';
import 'package:login/service/auth/auth_service.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key, required this.authService}) : super(key: key);
  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          const TopBar(),
          Body(
            size: size,
            authService: authService,
          ),
        ],
      ),
    );
  }
}
