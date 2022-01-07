import 'package:flutter/material.dart';
import 'package:login/theme/style.dart';

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "All",
    "Networking",
    "Web Programming",
    "Mobile Dev",
    "Design Figma"
  ];
  int selecetedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
          height: widget.size.height * 0.05,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => buildCategories(index))),
    );
  }

  Widget buildCategories(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selecetedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color:
              selecetedIndex == index ? kPrimaryLightColor : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          categories[index],
          style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        ),
      ),
    );
  }
}
