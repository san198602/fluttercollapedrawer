import 'package:flutter/material.dart';

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
      body: const Center(child: Text('Welocme Dashboard')),
    );
  }
}
