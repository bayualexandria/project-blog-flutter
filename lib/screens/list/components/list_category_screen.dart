import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ListCategory extends StatelessWidget {
  const ListCategory({
    Key? key,
    required this.size,
    required this.name,
    required this.color,
    required this.icon,
  }) : super(key: key);

  final Size size;
  final String name;
  final String color;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: AspectRatio(
          aspectRatio: 2,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(int.parse('FF$color', radix: 16))),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20)),
                      const Spacer(),
                      buildInfoRow(icon: EvaIcons.person, text: 'Bayu Wardana'),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      buildInfoRow(icon: EvaIcons.creditCard, text: '90 post'),
                      const Spacer()
                    ],
                  ),
                )),
                Container(
                  margin: const EdgeInsets.only(right: 35),
                  child: AspectRatio(
                      aspectRatio: 0.40,
                      child: SvgPicture.network(
                        'http://10.0.2.1:8000/storage/$icon',
                        alignment: Alignment.center,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          )),
    );
  }

  Row buildInfoRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          width: size.width * 0.01,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white54,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
