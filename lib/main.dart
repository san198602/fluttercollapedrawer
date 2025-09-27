import 'package:flutter/material.dart';
import 'package:fluttercollapedrawer/NavigationBar/NavDrawer.dart';

import 'package:fluttercollapedrawer/NavigationBar/NavigationProvider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:fluttercollapedrawer/Constants/constants.dart';

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
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      home: MyHomePage(),
    ),
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
    ),
    body: Container(
      padding: EdgeInsets.only(top: 100, bottom: 0, left: 5, right: 5),
      decoration: BoxDecoration(color: const Color.fromRGBO(255, 0, 0, 0.9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: SvgPicture.asset(
              'assets/svgs/elearning.svg',
              height: 80,
              width: 50,
            ),
          ),
          Flexible(
            flex: 1,
            child: SvgPicture.asset(
              'assets/svgs/setting.svg',
              height: 80,
              width: 80,
            ),
          ),
          Flexible(
            flex: 1,
            child: SvgPicture.asset(
              'assets/svgs/burn.svg',
              height: 80,
              width: 80,
            ),
          ),
          Flexible(
            flex: 1,
            child: SvgPicture.asset(
              'assets/svgs/distance.svg',
              height: 80,
              width: 80,
            ),
          ),
        ],
      ),
    ),
  );
}
