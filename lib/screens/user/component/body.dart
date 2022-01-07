import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/authentication_bloc.dart';
import 'package:login/screens/user/component/profile._menu_item.dart';
import 'package:login/screens/user/component/shape.dart';
import 'package:login/screens/user/model/user_model.dart';
import 'package:login/service/auth/auth_service.dart';
import 'package:login/service/user/user_service.dart';
import 'package:login/theme/style.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.size,
    required this.authService,
  }) : super(key: key);

  final Size size;
  final AuthService authService;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final String image = "assets/images/bayu.jpg";
  final userService = UserService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomShape(),
          child: Container(
            height: widget.size.height * 0.3,
            color: kPrimaryColor,
          ),
        ),
        Center(
          child: Column(
            children: [
              Container(
                height: widget.size.height * 0.4,
                width: widget.size.width * 0.4,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.white, width: widget.size.width * 0.02),
                    image: DecorationImage(image: AssetImage(image))),
              ),
              ProfileMenuItem(
                size: widget.size,
                icon: Icons.account_circle_outlined,
                name: 'Profile',
                press: () {},
              ),
              ProfileMenuItem(
                size: widget.size,
                icon: Icons.card_membership_sharp,
                name: 'List blogs',
                press: () {},
              ),
              ProfileMenuItem(
                size: widget.size,
                icon: Icons.settings,
                name: 'Settings',
                press: () {},
              ),
              ProfileMenuItem(
                size: widget.size,
                icon: Icons.logout,
                name: 'Logout',
                press: () {
                  modalLogout(context);
                },
              ),
            ],
          ),
        ),
        FutureBuilder<User?>(
            future: userService.getUser(),
            builder: (context, snaphsot) {
              User? user = snaphsot.data;
              if (user != null) {
                Data userData = user.data;
                return Center(
                    child: Column(
                  children: [
                    Text(
                      userData.name,
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          userData.email,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ));
              }
              return Text("");
            }),
      ],
    );
  }

  void modalLogout(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text(
        "Logged out",
        style: TextStyle(color: kPrimaryColor),
      ),
      content: Text(
        "Apakah anda ingin logout?",
        style: TextStyle(color: kPrimaryColor),
      ),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: kPrimaryColor),
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text("Tidak")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: kPrimaryColor),
            onPressed: () {
              Navigator.pop(context, false);
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
            child: Text("Ya"))
      ],
      elevation: 24,
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
