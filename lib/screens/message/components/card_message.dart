import 'package:flutter/material.dart';
import 'package:login/theme/style.dart';

class CardMessage extends StatefulWidget {
  const CardMessage({
    Key? key,
    required this.size,
    required this.title,
    required this.body, required this.image,
  }) : super(key: key);

  final Size size;
  final String title, body;
  final AssetImage image;

  @override
  State<CardMessage> createState() => _CardMessageState();
}

class _CardMessageState extends State<CardMessage> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() => active = true);
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          height: size.height * 0.1,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: active ? Colors.white : kPrimaryLightColor),
          child: Stack(
            children: [
              const Positioned(
                child: Text(
                  "3 min ago",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
                right: 5,
                top: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: widget.image,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      width: size.width * 0.75,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.title,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            widget.body,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
