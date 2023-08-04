import 'package:flutter/material.dart';

class Result extends StatelessWidget {
   Result({super.key ,required this.a,required this.v,required this.unit});
  double a,v;
  String unit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("area is $a $unit ^2  *** volume is $v $unit ^3")
          ],
        ),
      ),
    );
  }
}