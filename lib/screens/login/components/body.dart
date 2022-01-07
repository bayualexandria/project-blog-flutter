import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login/screens/component/already_have_an_account_check.dart';
import 'package:login/screens/component/rounded_button.dart';
import 'package:login/screens/component/rounded_input_field.dart';
import 'package:login/screens/component/rounded_password_field.dart';
import 'package:login/screens/login/bloc/login.dart';
import 'package:login/screens/login/components/background.dart';
import 'package:login/screens/register/register.dart';
import 'package:login/service/auth/auth_service.dart';
import 'package:login/theme/style.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.authService}) : super(key: key);
  final AuthService authService;

  @override
  State<Body> createState() => _BodyState(authService);
}

class _BodyState extends State<Body> {
  final email = TextEditingController();

  final password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final AuthService authService;

  FlutterSecureStorage storage = FlutterSecureStorage();

  _BodyState(this.authService);

  @override
  void initState() {
    token();
    super.initState();
  }

  token() async {
    final response = await storage.read(key: 'token');
    print('token : $response');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(email: email.text, password: password.text),
      );
      // Timer(Duration(seconds: 1), () {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => HomeScreen(repository: repository)));
      // });
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Email atau password yang anda masukan salah"),
              backgroundColor: Colors.red));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Background(
          size: size,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "LOGIN",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontFamily: "Gaegu",
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                SvgPicture.asset("assets/images/mobile_login.svg",
                    height: size.height * 0.30),
                SizedBox(height: size.height * 0.05),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        RoundedInputField(
                          size: size,
                          controller: email,
                          hintText: 'Your Email',
                          icon: Icons.person,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email harus diisi';
                            }
                            return null;
                          },
                        ),
                        RoundedPasswordField(
                          size: size,
                          hintText: 'Your Password',
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
                            text: "LOGIN",
                            press: () {
                              if (_formKey.currentState!.validate()) {
                                _onLoginButtonPressed();
                              }
                            },
                            color: kPrimaryColor,
                            textColor: Colors.white),
                      ],
                    )),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen(
                                  authService: authService,
                                )));
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
