import 'package:flutter/material.dart';
import 'package:login/theme/style.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key? key,
    required this.size,
    required this.icon,
    required this.name,
    required this.press,
  }) : super(key: key);

  final Size size;
  final IconData icon;
  final String name;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Row(
          children: [
            Icon(icon, color: kPrimaryColor),
            SizedBox(
              width: size.width * 0.05,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right,
              color: kPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}