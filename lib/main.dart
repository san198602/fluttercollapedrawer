import 'package:flutter/material.dart';
import 'package:fluttercollapedrawer/NavigationBar/NavDrawer.dart';

import 'package:fluttercollapedrawer/NavigationBar/NavigationProvider.dart';

import 'package:provider/provider.dart';
import 'package:fluttercollapedrawer/Constants/const.dart';

import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final String title = "Navigation Drawer";
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => Navigationprovider(),
    child: MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage()),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    extendBodyBehindAppBar: true,
    drawer: NavDrawer(),

    appBar: AppBar(
      backgroundColor: Color.fromRGBO(120, 10, 10, 0.9),
      elevation: 0,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            padding: EdgeInsets.all(15.0),
            icon: Image.asset('assets/images/menu0.png'),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: "Click Here to Open the door!!",
          );
        },
      ),
      title: Text(
        MyApp.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
    ),
    body: Center(
      child: SvgPicture.asset(
        'assets/svgs/list-menu-svgrepo-com.svg',
        semanticsLabel: 'My SVG Image',
        height: 100,
        width: 70,
      ),
    ),
  );
}
