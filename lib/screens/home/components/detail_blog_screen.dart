import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:login/theme/style.dart';

class BlogDetailScreen extends StatefulWidget {
  const BlogDetailScreen({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  bool like = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Hero(
            createRectTween: (begin, end) => MaterialRectCenterArcTween(),
            tag: widget.data['title'],
            child: Container(
              child: Column(
                children: [
                  header(context),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 20),
                      height: size.height,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.data['title'],
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Kategori : ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryLightColor),
                              ),
                              Text(
                                widget.data['category']['name'],
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryLightColor),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Column(
                            children: [
                              IconDetail(
                                size: size,
                                text: widget.data['user']['name'],
                                icon: Icons.person,
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              IconDetail(
                                  size: size, text: '100', icon: EvaIcons.heart)
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                widget.data['body'],
                                textAlign: TextAlign.justify,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }

  Stack header(BuildContext context) {
    final image = widget.data['image'];
    return Stack(children: [
      Column(
        children: [
          Image.network(
            "http://10.0.2.1:8000/storage/$image",
            width: double.infinity,
          ),
          // Text(data['title'])
        ],
      ),
      Positioned(
          top: 30,
          left: 8,
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 24,
              ))),
      Positioned(
          top: 30,
          right: 8,
          child: IconButton(
              onPressed: () {
                setState(() {
                  like = !like;
                });
              },
              icon: like
                  ? const Icon(
                      EvaIcons.heart,
                      color: Colors.red,
                      size: 24,
                    )
                  : const Icon(
                      EvaIcons.heartOutline,
                      color: Colors.white,
                      size: 24,
                    ))),
    ]);
  }
}

class IconDetail extends StatelessWidget {
  const IconDetail({
    Key? key,
    required this.size,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final Size size;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: kPrimaryColor,
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        Text(
          text,
          style: const TextStyle(
            color: kPrimaryColor,
          ),
        )
      ],
    );
  }
}
