import 'package:flutter/material.dart';
import 'package:login/theme/style.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      child: Row(
        children: [
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
            ),
          ),
          buildDivider()
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
        child: Divider(color: Color(0xFF000000), height: 1.5));
  }
}