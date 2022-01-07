import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/screens/list/components/list_category_screen.dart';
import 'package:login/service/category/category_service.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final categoryService = CategoryService();

  List dataCategory = [];

  void get() {
    categoryService.get().then((value) => {
          setState(() {
            dataCategory = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<dynamic>?>(
        future: categoryService.get(),
        builder: (context, snapshoot) {
          if (snapshoot.hasData) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.02),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshoot.data!.length,
                        itemBuilder: (_, index) {
                          String data = snapshoot.data![index]['color'];
                          final color = data.toUpperCase().replaceAll("#", "");
                          return ListCategory(
                              size: size,
                              color: color,
                              name: snapshoot.data![index]['name'],
                              icon: snapshoot.data![index]['icon']);
                        }),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

