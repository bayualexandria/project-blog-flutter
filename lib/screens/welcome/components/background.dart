import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.size,
    required this.child,
  }) : super(key: key);

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: SvgPicture.asset(
              "assets/images/shape_top_left_welcome.svg",
              width: size.width * 0.3,
            ),
            top: 0,
            left: 0,
          ),
          Positioned(
            child: SvgPicture.asset(
              "assets/images/shape_bottom_right_welcome.svg",
              width: size.width * 0.3,
            ),
            bottom: 0,
            right: 0,
          ),
          child
        ],
      ),
    );
  }
}
