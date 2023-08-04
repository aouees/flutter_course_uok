import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyRow extends StatelessWidget {
  bool? checkValue;
  String title;
  Function(bool?)? onChang;
  MyRow({
    super.key,
    required this.checkValue,
    required this.title,
    required this.onChang,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
      child: Row(
        children: [
          Checkbox(
            value: checkValue,
            onChanged: onChang,
            activeColor: Theme.of(context).colorScheme.primary,
            checkColor: Colors.white,
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
