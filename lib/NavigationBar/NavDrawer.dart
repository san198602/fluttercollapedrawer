// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:fluttercollapedrawer/NavigationBar/NavigationProvider.dart';
import 'package:fluttercollapedrawer/data/DrawerData.dart';
import 'package:fluttercollapedrawer/model/DrawerModel.dart';
import 'package:fluttercollapedrawer/screens/home.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({super.key});
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Navigationprovider>(context);
    final isCollpsed = provider.isCollapse;
    final safearea = EdgeInsets.only(
      top: MediaQuery.of(context).viewPadding.top,
    );
    // ignore: sized_box_for_whitespace
    return Container(
      // ignore: dead_code
      width: isCollpsed ? MediaQuery.of(context).size.width * 0.2 : null,
      child: Drawer(
        child: Container(
          color: Color(0xFF1a2f45),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 24).add(safearea),
                width: double.infinity,
                color: Colors.white12,
                child: buildHeader(isCollpsed),
              ),
              const SizedBox(height: 20),
              BuildList(items: firstItems, isCollpsed: isCollpsed),
              const SizedBox(height: 24),
              Divider(color: Colors.white),
              const SizedBox(height: 24),
              BuildList(items: secondItems, isCollpsed: isCollpsed),
              Spacer(),
              buildCollapseIcon(context, isCollpsed),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(bool isCollpsed) => isCollpsed
      ? FlutterLogo(size: 48)
      : Row(
          children: <Widget>[
            const SizedBox(width: 24),
            FlutterLogo(size: 48),
            const SizedBox(width: 24),
            Text(
              "Flutter",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );

  Widget buildCollapseIcon(BuildContext context, bool isCollpsed) {
    final double size = 60;

    final icon = isCollpsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final alignment = isCollpsed ? Alignment.center : Alignment.topRight;
    final margin = EdgeInsets.only(right: 10);
    final width = isCollpsed ? double.infinity : size;

    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            width: width,
            height: size,
            child: Icon(icon, color: Colors.white),
          ),
          onTap: () {
            final provider = Provider.of<Navigationprovider>(
              context,
              listen: false,
            );
            provider.toggleIsCollapased();
          },
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BuildList({
    required List<DrawerModel> items,
    required bool isCollpsed,
  }) => ListView.separated(
    padding: isCollpsed ? EdgeInsets.zero : padding,
    shrinkWrap: true,
    primary: false,
    itemCount: items.length,
    separatorBuilder: (contex, index) => SizedBox(height: 10),
    itemBuilder: (context, index) {
      final item = items[index];

      return buildMenuItem(
        isCollpsed: isCollpsed,
        text: item.title,
        icon: item.icon,
        onClicked: () => SelectItem(context, index),
      );
    },
  );

  Widget buildMenuItem({
    required bool isCollpsed,
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final leading = Icon(icon, color: color);

    return Material(
      color: Colors.transparent,
      child: isCollpsed
          ? ListTile(leading: leading, onTap: onClicked)
          : ListTile(
              leading: leading,
              title: Text(text, style: TextStyle(color: color, fontSize: 20)),
              onTap: onClicked,
            ),
    );
  }

  // ignore: non_constant_identifier_names
  void SelectItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: HomePage(),
          ),
        );

        break;
    }
  }
}
