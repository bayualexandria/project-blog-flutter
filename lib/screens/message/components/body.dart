import 'package:flutter/material.dart';
import 'package:login/screens/message/components/card_message.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.04,
        ),
        CardMessage(
          size: size,
          title: 'Activation account',
          body: 'Activation to account have been successfully',
          image: AssetImage("assets/images/bayu.jpg"),
        ),
        CardMessage(
            size: size,
            title: 'Freamwork Laravel 8',
            body: 'It is good the post to app it',
            image: AssetImage("assets/images/bayu1.jpeg")),
        CardMessage(
            size: size,
            title: 'Please help',
            body: 'Make app flutter for school',
            image: AssetImage("assets/images/bayu2.jpg")),
        CardMessage(
            size: size,
            title: 'UI/UX Design Figma',
            body: 'Good idea for design it, good job',
            image: AssetImage("assets/images/bayu3.jpg")),
        CardMessage(
            size: size,
            title: 'Freamwork React JS',
            body: 'How to make props to statefull component',
            image: AssetImage("assets/images/bayu4.jpg")),
      ],
    );
  }
}
