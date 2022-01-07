import 'package:flutter/material.dart';
import 'package:login/screens/home/components/blog_screen.dart';
import 'package:login/screens/home/components/categories.dart';
import 'package:login/screens/home/components/top_bar_screen.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      const TopBar(),
      Categories(size: size),
      LoopDataBlog(size: size)
    ]);
  }
}




