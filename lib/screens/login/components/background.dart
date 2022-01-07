import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.size, required this.child,
  }) : super(key: key);

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: SvgPicture.asset("assets/images/shape_top_left_login.svg",
                width: size.width * 0.35),
            top: 0,
            left: 0,
          ),
          Positioned(
            child: SvgPicture.asset("assets/images/shape_bottom_left_login.svg",
                width: size.width * 0.35),
            bottom: 0,
            left: 0,
          ),child
        ],
      ),
    );
  }
}
