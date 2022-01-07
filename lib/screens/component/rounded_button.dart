import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.size,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 9),
      width: size.width * 0.8,
      height: size.height * 0.07,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          child: Text(text, style: TextStyle(color: textColor)),
          onPressed: press,
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(), primary: color),
        ),
      ),
    );
  }
}
