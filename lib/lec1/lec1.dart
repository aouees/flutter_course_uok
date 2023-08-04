import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Simple Calaculator",
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  int Result = 0;

  int add(String n1, String n2) {
    setState(() {
      Result = int.parse(n1) + int.parse(n2);
    });
    return Result;
  }

  int div(String n1, String n2) {
    setState(() {
      Result = int.parse(n1) ~/ int.parse(n2);
    });
    return Result;
  }

  int sub(String n1, String n2) {
    setState(() {
      Result = int.parse(n1) - int.parse(n2);
    });
    return Result;
  }
  int multi(String n1, String n2) {
    setState(() {
      Result = int.parse(n1) * int.parse(n2);
    });
    return Result;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: const Text("Calaculater")),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Text(
              "Result : $Result",
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
                    Result = add(controller1.text, controller2.text);
                    controller1.clear();
                    controller2.clear();
                  },
                  child: const Text("+"),
                ),
                ElevatedButton(
                    onPressed: () {
                      Result = sub(controller1.text, controller2.text);
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
                ElevatedButton(onPressed: () {
                  Result = multi(controller1.text, controller2.text);
                  controller2.clear();
                  controller1.clear();
                }, child: const Text("*")),
                ElevatedButton(
                    onPressed: () {
                      Result = div(controller1.text, controller2.text);
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
