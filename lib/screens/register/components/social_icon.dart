import 'package:flutter/material.dart';
import 'package:login/theme/style.dart';

class SocalIcons extends StatelessWidget {
  final IconData icon;
  final Function() press;
  const SocalIcons({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: kPrimaryLightColor),
            shape: BoxShape.circle),
        child: Icon(
          icon,
          size: 20,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}