import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/bloc/authentication_bloc.dart';
import 'package:login/screens/component/already_have_an_account_check.dart';
import 'package:login/screens/component/rounded_button.dart';
import 'package:login/screens/component/rounded_input_field.dart';
import 'package:login/screens/component/rounded_password_field.dart';
import 'package:login/screens/login/login.dart';
import 'package:login/screens/register/components/background.dart';
import 'package:login/screens/register/components/or_divider.dart';
import 'package:login/screens/register/components/social_icon.dart';
import 'package:login/service/auth/auth_service.dart';
import 'package:login/theme/style.dart';

class Body extends StatelessWidget {
  Body({Key? key, required this.authService}) : super(key: key);
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final AuthService authService;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      size: size,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SIGN IN",
              style: TextStyle(
                  fontFamily: "Gaegu",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
            SvgPicture.asset("assets/images/notifications.svg",
                height: size.height * 0.3),
            SizedBox(height: size.height * 0.05),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    RoundedInputField(
                      size: size,
                      icon: Icons.person,
                      hintText: "Your Name",
                      controller: name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama harus diisi';
                        }
                        return null;
                      },
                    ),
                    RoundedInputField(
                      size: size,
                      icon: Icons.mail,
                      hintText: "Your Email",
                      controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email harus diisi';
                        }
                        return null;
                      },
                    ),
                    RoundedPasswordField(
                      size: size,
                      hintText: "Your Password",
                      controller: password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password harus diisi';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    RoundedButton(
                        size: size,
                        text: "REGISTER",
                        press: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        color: kPrimaryColor,
                        textColor: Colors.white),
                  ],
                )),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen(
                              authenticationBloc:
                                  AuthenticationBloc(authService: authService),
                                  authService: authService,
                              
                            )));
              },
              login: false,
            ),
            OrDivider(size: size),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocalIcons(
                  icon: Icons.facebook,
                  press: () {},
                ),
                SocalIcons(
                  icon: Icons.mail,
                  press: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
