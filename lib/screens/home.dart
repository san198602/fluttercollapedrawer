import 'package:flutter/material.dart';
import 'package:fluttercollapedrawer/Charts/MyLineChart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(150, 110, 10, 0.9),
        foregroundColor: Colors.white,

        title: Text("Dashboard"),
        elevation: 0.9,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AspectRatio(
            aspectRatio: 1.70, // Adjust aspect ratio as needed
            child: MyLineChart(),
          ),
        ),
      ),
    );
  }
}
