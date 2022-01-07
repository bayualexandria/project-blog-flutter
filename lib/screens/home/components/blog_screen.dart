import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/screens/home/components/detail_blog_screen.dart';
import 'package:login/service/blog/blog_service.dart';

class LoopDataBlog extends StatefulWidget {
  const LoopDataBlog({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<LoopDataBlog> createState() => _LoopDataBlogState();
}

class _LoopDataBlogState extends State<LoopDataBlog> {
  List dataBlog = [];
  final blogService = BlogService();

  void get() {
    blogService.get().then((value) => {
          setState(() {
            dataBlog = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: blogService.get(),
        builder: (_, snapshoot) {
          if (snapshoot.hasData) {
            return Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListView.builder(
                  itemCount: snapshoot.data!.length,
                  itemBuilder: (_, index) {
                    print(snapshoot.data);
                    String data = snapshoot.data![index]['category']['color'];
                    final color = data.toUpperCase().replaceAll("#", "");
                    String image = snapshoot.data![index]['image'];
                    return AspectRatio(
                      aspectRatio: 1.65,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlogDetailScreen(
                                        data: snapshoot.data![index],
                                      )));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                              color: Color(int.parse('FF$color', radix: 16)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Spacer(),
                                    Text(
                                      snapshoot.data![index]['category']
                                          ['name'],
                                      style: const TextStyle(
                                          fontSize: 22, color: Colors.white),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: widget.size.height * 0.01),
                                    Text(
                                      snapshoot.data![index]['title'],
                                      style: const TextStyle(
                                        color: Colors.white54,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Spacer(),
                                    buildInfoRow(
                                        icon: EvaIcons.heart,
                                        text: "100 likes"),
                                    SizedBox(
                                        height: widget.size.height * 0.005),
                                    buildInfoRow(
                                        icon: EvaIcons.messageCircle,
                                        text: "10 comments"),
                                    const Spacer()
                                  ],
                                ),
                              )),
                              AspectRatio(
                                  aspectRatio: 0.71,
                                  child: Image.network(
                                    'http://10.0.2.1:8000/storage/$image',
                                    fit: BoxFit.cover,
                                    alignment: Alignment.centerLeft,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ));
          }
          return Center();
        });
  }

  Row buildInfoRow({required IconData icon, required String text}) {
    Size size = MediaQuery.of(context).size;
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
