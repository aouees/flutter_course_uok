import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/wf/dataModel.dart';
import '/wf/mywidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var s = [
    Subject(
        checked: true,
        name: "Course 1",
        teacherName: "Teacher X",
        numberRegister: 25,
        number: 3,
        ),
    Subject(
        checked: false,
        name: "Course 2",
        teacherName: "Teacher Y",
        numberRegister: 40,
        number: 5,
        ),
        Subject(
        checked: false,
        name: "Course 3",
        teacherName: "Teacher Y",
        numberRegister: 7,
        number: 9,
        ),
        
  ];
  @override
  Widget build(BuildContext context) {
    int cnt=0;
    s.where((e) => e.checked).forEach((element) {
      cnt+=element.number;
     });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Final Project"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.orange[800],
            child: const Text(
              "Owis AlHammoud - 201811330 ",
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue[900]!,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(8.0),
            width: double.infinity,
            child: Text(
              "you have selected ${s.where(((e) => e.checked)).length}/${s.length} items , ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue[900],
              ),
            ),
          ),
           Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue[900]!,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(8.0),
            width: double.infinity,
            child: Text(
              "you have selected $cnt hours number , ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue[900],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return SubjectWidget(
                  s[index],
                  onChecked: (v) {
                    setState(() {
                      s[index].checked = !s[index].checked;
                    });
                  },
                  onEdit: () {
                    _showMyDialog(index: index);
                  },
                  onPressed: () {
                    setState(() {
                      s[index].checked = !s[index].checked;
                    });
                  },
                );
              },
              itemCount: s.length,
            ),
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                _showMyDialog();
              },
              icon: const Icon(Icons.create_new_folder_outlined),
              label: const Text("new Course"),
            ),
          ),
        ],
      ),
    );
  }

  _showMyDialog({int? index}) {
    var cn = TextEditingController(),
        tn = TextEditingController(),
        rn = TextEditingController();
    var formKey = GlobalKey<FormState>();
    if (index != null) {
      cn.text = s[index].name;
      tn.text = s[index].teacherName;
      rn.text = s[index].numberRegister.toString();
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            ElevatedButton.icon(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    if (index == null) {
                      var t = Subject(
                        checked: false,
                        name: cn.text,
                        teacherName: tn.text,
                        numberRegister: int.parse(rn.text),
                        number: 1,
                      );
                      s.add(t);
                    } else {
                      s[index].name = cn.text;
                      s[index].teacherName = tn.text;
                      s[index].numberRegister = int.parse(rn.text);
                    }
                    Navigator.of(context).pop();
                  });
                }
              },
              icon: const Icon(Icons.save_outlined),
              label: const Text("Save"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.cancel_outlined),
              label: const Text("Cancel"),
            ),
          ],
          content: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue[900]!),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    myTextForm(
                      c: cn,
                      label: "enter course name",
                    ),
                    myTextForm(
                      c: tn,
                      label: "enter teacher name",
                    ),
                    myTextForm(
                        c: rn,
                        label: "enter number Registers",
                        type: TextInputType.number),
                  ],
                )),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          scrollable: true,
          title: Text(
            "${index == null ? 'Add New' : 'Update'} Course",
            style: TextStyle(
              color: Colors.blue[900],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        );
      },
    );
  }
}
