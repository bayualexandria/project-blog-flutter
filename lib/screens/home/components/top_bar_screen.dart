import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:login/theme/style.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: () {}, icon: const Icon(EvaIcons.menu)),
      centerTitle: true,
      title: const Text(
        "Alexandria",
        style:
            TextStyle(fontFamily: "Gaegu", fontSize: 24, color: kPrimaryColor),
      ),
      backgroundColor: Colors.white,
      bottomOpacity: 0,
      elevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(EvaIcons.search)),
      ],
      iconTheme: const IconThemeData(color: Color(0xFFD9D9D9)),
    );
  }
}