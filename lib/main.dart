import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/authentication_bloc.dart';
import 'package:login/screens/home/home_screen.dart';
import 'package:login/screens/login/login.dart';
import 'package:login/screens/welcome/welcome_screen.dart';
import 'package:login/service/auth/auth_service.dart';
import 'package:login/theme/style.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

void main() {
  final AuthService authService = AuthService();

  BlocOverrides.runZoned(
    () {
      runApp(
        BlocProvider<AuthenticationBloc>(
            create: (context) {
              return AuthenticationBloc(authService: authService)
                ..add(AppStarted());
            },
            child: MyApp(
              authService: authService,
            )),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.authService}) : super(key: key);
  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Column(
            children: const [
              Icon(EvaIcons.code, size: 50, color: Colors.white),
              SizedBox(
                height: 5,
              ),
              Text(
                "Code with b4yu 4lex@ndr!4",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: kPrimaryColor,
          nextScreen: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationAuthenticated) {
                // print('state :$state');
                return HomeScreen(
                  authService: authService,
                );
              }

              if (state is AuthenticationUninitialized) {
                print('state :$state');
                return const WelcomeScreen();
              }

              if (state is AuthenticationUnauthenticated) {
                // print('state :$state');
                return LoginScreen(
                  authService: authService,
                  authenticationBloc:
                      AuthenticationBloc(authService: authService),
                );

                // return const WelcomeScreen();
              }
              if (state is AuthenticationLoading) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }

              return const WelcomeScreen();
            },
          ),
        ));
  }
}
