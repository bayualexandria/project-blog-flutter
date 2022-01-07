import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/screens/user/bloc/user_bloc.dart';
import 'package:login/service/user/user_service.dart';

import 'model/user_model.dart';
import 'package:login/theme/style.dart' as color;

class UserEdit extends StatefulWidget {
  UserEdit({Key? key, required this.user, required this.userService})
      : super(key: key);
  Data user;
  UserService userService;

  @override
  State<UserEdit> createState() =>
      _UserEditState(user: user, userService: userService);
}

class _UserEditState extends State<UserEdit> {
  Data user;
  UserService userService;

  _UserEditState({required this.user, required this.userService});
  final name = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => UserBloc(userService: userService),
          child: Column(
            children: [
              AppBar(
                title: const Text(
                  "Edit Profile",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: color.kPrimaryColor),
                ),
                // leading: IconButton(
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //     icon: const Icon(
                //       Icons.chevron_left,
                //       size: 30,
                //     )),
                backgroundColor: Colors.white12,
                bottomOpacity: 0,
                elevation: 0,
                actions: [
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserLoaded) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: color.kPrimaryColor,
                          ),
                        );
                      }
                      return IconButton(
                        onPressed: () {
                          BlocProvider.of<UserBloc>(context)
                              .add(ButtonUpdatedUser(name: name.text));
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.check,
                          size: 30,
                        ),
                        color: Colors.blue,
                      );
                    },
                  ),
                ],
                iconTheme: const IconThemeData(color: color.kPrimaryColor),
              ),
              Hero(
                transitionOnUserGestures: false,
                tag: user.email,
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.white, width: size.width * 0.02),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/bayu.jpg'))),
                    ),
                    const Text(
                      "Ganti Foto Profile",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 30),
                      child: Column(
                        children: [
                          TextFormField(
                              controller: name..text = user.name,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.black),
                                labelText: "Nama",
                                labelStyle: TextStyle(color: Colors.black45),
                                alignLabelWithHint: false,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black45),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black45),
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
