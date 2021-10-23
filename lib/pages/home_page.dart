import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int days = 60;
    final String name = "Daniyal Ahmed";
    return Scaffold(
      appBar: AppBar(
        title: Text('Test App'),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to the $days app of flutter by " + name),
        ),
      ),
      drawer: Drawer(),
    );
  }
}