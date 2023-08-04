import 'package:flutter/material.dart';
import 'pages/first.dart';

void main() {
  runApp(const MaterialApp(
    title: "Simple Calaculator",
    debugShowCheckedModeBanner: false,
    home: Lec2(),
  ));
}

class Lec2 extends StatefulWidget {
  const Lec2({super.key});

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  int result = 0;

  int add(String n1, String n2) {
    setState(() {
      result = int.parse(n1) + int.parse(n2);
    });
    return result;
  }

  int div(String n1, String n2) {
    setState(() {
      result = int.parse(n1) ~/ int.parse(n2);
    });
    return result;
  }

  int sub(String n1, String n2) {
    setState(() {
      result = int.parse(n1) - int.parse(n2);
    });
    return result;
  }

  int multi(String n1, String n2) {
    setState(() {
      result = int.parse(n1) * int.parse(n2);
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Calaculater")),
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text("aaa"),
                accountEmail: Text("aaa@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Text(
                    "CALC",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  First(name: "loream",),
                  ));
                },
                leading: const CircleAvatar(
                  child: Icon(Icons.home_filled),
                ),
                title: const Text('Home'),
              ),
              ListTile(
                onTap: () {},
                leading: const CircleAvatar(
                  child: Icon(Icons.search),
                ),
                title: const Text("Search"),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Text(
              "Result : $result",
              style: const TextStyle(
                  color: Color.fromARGB(255, 119, 11, 206),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller1,
              decoration: const InputDecoration(
                  labelText: "enter first number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller2,
              decoration: const InputDecoration(
                  labelText: "enter second number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                  onPressed: () {
                    result = add(controller1.text, controller2.text);
                    controller1.clear();
                    controller2.clear();
                  },
                  child: const Text("+"),
                ),
                ElevatedButton(
                    onPressed: () {
                      result = sub(controller1.text, controller2.text);
                      controller1.clear();
                      controller2.clear();
                    },
                    child: const Text("-"))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      result = multi(controller1.text, controller2.text);
                      controller2.clear();
                      controller1.clear();
                    },
                    child: const Text("*")),
                ElevatedButton(
                    onPressed: () {
                      result = div(controller1.text, controller2.text);
                      controller2.clear();
                      controller1.clear();
                    },
                    child: const Text("/"))
              ],
            )
          ]),
        ));
  }
}
