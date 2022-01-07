import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:login/screens/message/components/body.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Body(size: size),
    );
  }
}
