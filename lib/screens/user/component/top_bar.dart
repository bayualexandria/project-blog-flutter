import 'package:flutter/material.dart';
import 'package:login/screens/user/edit_user.dart';
import 'package:login/screens/user/model/user_model.dart';
import 'package:login/service/user/user_service.dart';
import 'package:login/theme/style.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: kPrimaryColor,
      bottomOpacity: 0,
      elevation: 0,
      actions: [
        FutureBuilder<User?>(
            future: UserService().getUser(),
            builder: (context, snapshot) {
              User? user = snapshot.data;
              print('Edit profile');
              if (user != null) {
                Data userData = user.data;
                print(userData);
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => UserEdit(
                                  user: userData,
                                  userService: UserService(),
                                )));
                  },
                  child: const Text("Edit"),
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      elevation: 1,
                      shadowColor: kPrimaryColor),
                );
              }
              return Text("");
            }),
      ],
    );
  }
}
