// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '/wf/dataModel.dart';

class SubjectWidget extends StatelessWidget {
  SubjectWidget(this.s,
      {super.key,
      this.onPressed,
      required this.onChecked,
      required this.onEdit});
  Subject s;
  void Function(bool?)? onChecked = (v) {};
  void Function()? onEdit = () {};
  void Function()? onPressed = () {};
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.all(8.0),
        color: s.checked ? Colors.blue[900]!.withOpacity(0.2) : null,
        child: Row(
          children: [
             Icon(
              Icons.menu_book_outlined,
              size: 50,
              color: s.checked ? Colors.blue[900] : Colors.grey[700],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    s.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                        fontSize: 22),
                  ),
                  Text(
                    s.teacherName,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    "number Register Student is ${s.numberRegister}",
                  ),
                  Text("number hours ${s.number}")
                ],
              ),
            ),
            Checkbox(
              value: s.checked,
              onChanged: onChecked,
            ),
             const SizedBox(
              width: 10.0,
            ),
            ElevatedButton(
              onPressed: onEdit,
              child: const Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}

myTextForm({
  required TextEditingController c,
  required String label,
  TextInputType type = TextInputType.text,
}) {
  return TextFormField(
    textAlign: TextAlign.start,
    decoration: InputDecoration(
      floatingLabelAlignment: FloatingLabelAlignment.center,
      label: Text(label),
    ),
    keyboardType: type,
    validator: (value) {
      if (value!.isEmpty) {
        return "OOPS, is empty:)";
      }
      return null;
    },
    controller: c,
  );
}
