import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/home/components/body.dart';
import 'package:login/screens/list/list.dart';
import 'package:login/screens/message/message.dart';
import 'package:login/screens/user/user.dart';
import 'package:login/service/auth/auth_service.dart';
import 'package:login/theme/style.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.authService}) : super(key: key);
  final AuthService authService;
  @override
  State<HomeScreen> createState() => _HomeScreenState(authService);
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService authService;
  int _selectedIndex = 0;

  _HomeScreenState(this.authService);

  FlutterSecureStorage storage = const FlutterSecureStorage();


  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(),
      body: bodyWidget.elementAt(_selectedIndex),
      bottomNavigationBar: CustomNavigationBar(
        items: buildNavigation,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedColor: kPrimaryColor,
        unSelectedColor: kPrimaryLightColor,
        strokeColor: kPrimaryColor,
      ),
    );
  }

  List<CustomNavigationBarItem> get buildNavigation {
    return <CustomNavigationBarItem>[
      itemNav(icon: EvaIcons.home, title: "Home"),
      itemNav(icon: EvaIcons.messageCircle, title: "Message"),
      itemNav(icon: EvaIcons.list, title: "List"),
      itemNav(icon: Icons.account_circle, title: "User"),
    ];
  }

  List<Widget> get bodyWidget {
    return <Widget>[
      const Body(),
      const MessageScreen(),
      const ListScreen(),
      UserScreen(
        authService: authService,
      )
    ];
  }

  CustomNavigationBarItem itemNav(
      {required IconData icon, required String title}) {
    return CustomNavigationBarItem(
        icon: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(color: kPrimaryColor),
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(onPressed: () {}, icon: const Icon(EvaIcons.menu)),
      centerTitle: true,
      title: const Text(
        "Alexandria",
        style:
            TextStyle(fontFamily: "Gaegu", fontSize: 24, color: kPrimaryColor),
      ),
      backgroundColor: Colors.white,
      bottomOpacity: 0,
      elevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(EvaIcons.search)),
      ],
      iconTheme: const IconThemeData(color: Color(0xFFD9D9D9)),
    );
  }
}
