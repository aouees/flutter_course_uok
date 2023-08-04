import 'package:flutter/material.dart';
import '/lec2-1/rowModel.dart';
import 'component/myWidget.dart';

class Lec21 extends StatefulWidget {
  const Lec21({super.key});

  @override
  State<Lec21> createState() => _Lec21State();
}

class _Lec21State extends State<Lec21> {
  var data = [
    RowModel("aaa", false),
    RowModel("bbb", true),
    RowModel("ccc", true),
  ];
  var c = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lec6"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MyRow(
            checkValue: data[index].checked,
            title: data[index].title,
            onChang: (v) {
              setState(() {
                data[index].checked = v;
              });
            },
          );
        },
        itemCount: data.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: c,
                decoration: InputDecoration(labelText: "enter name task"),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          data.add(RowModel(c.text, false));
                          c.clear();
                        });
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.add),
                      label: Text("Add")),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.cancel_outlined),
                      label: Text("Cancle")),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
