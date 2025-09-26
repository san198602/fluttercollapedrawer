import 'package:flutter/material.dart';
import 'package:fluttercollapedrawer/NavDrawer.dart';
import 'package:fluttercollapedrawer/NavigationProvider.dart';
import 'package:provider/provider.dart';

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
      theme: ThemeData(primarySwatch: Colors.deepOrange),

      home: const MyHomePage(),
      title: title,
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
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
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
    body: SafeArea(child: Text("Content!!!!")),
  );
}
