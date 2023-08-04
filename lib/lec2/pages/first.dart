import 'package:flutter/material.dart';

// ignore: must_be_immutable
class First extends StatelessWidget {
  String name;
  First({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First"),
      ),
      body:  Center(
        child: CircleAvatar(
          radius: 100,
          backgroundColor: Colors.blueAccent,
          child: Text(" $name "),
        ),
      ),
    );
  }
}
