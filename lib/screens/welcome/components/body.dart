import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/bloc/authentication_bloc.dart';
import 'package:login/screens/component/rounded_button.dart';
import 'package:login/screens/login/login.dart';
import 'package:login/screens/register/register.dart';
import 'package:login/screens/welcome/components/background.dart';
import 'package:login/service/auth/auth_service.dart';
import 'package:login/theme/style.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);
  final  authService=AuthService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      size: size,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "WELCOME TO MY APP",
            style: TextStyle(
                fontFamily: "Gaegu",
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: kPrimaryColor),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          SvgPicture.asset(
            "assets/images/happy.svg",
            height: size.height * 0.30,
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          RoundedButton(
            size: size,
            color: kPrimaryColor,
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginScreen(
                            authService: authService,
                            authenticationBloc:
                                AuthenticationBloc(authService: authService),
                          )));
            },
            text: 'LOGIN',
            textColor: Colors.white,
          ),
          RoundedButton(
            size: size,
            color: kPrimaryLightColor,
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterScreen(
                            authService: authService,
                          )));
            },
            text: 'SIGN UP',
            textColor: Colors.black,
          )
        ],
      ),
    );
  }
}
