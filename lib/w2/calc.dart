import 'dart:js_interop';

import 'package:flutter/material.dart';
import '/w2/res.dart';

// ignore: must_be_immutable
class Calculator extends StatefulWidget {
  Calculator({super.key, required this.unit});
  String unit;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var formkey = GlobalKey<FormState>();
  var x = TextEditingController();
  var y = TextEditingController();
  var z = TextEditingController();
  var res = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "${x.text} * ${y.text} = $res ${widget.unit}^2",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                          label: const Text("enter first number"),
                          suffixText: widget.unit,
                          suffixStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary)),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "OOPS, is empty :) ";
                        }
                        if (double.tryParse(value).isNull) {
                          return "just a NUMBER  :\$ ";
                        }
                        return null;
                      },
                      controller: x,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        label: const Text("enter secound number"),
                        suffixStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                        suffixText: widget.unit,
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "OOPS, is empty:)";
                        }
                        if (double.tryParse(value).isNull) {
                          return "just NUMBER :\$";
                        }
                        return null;
                      },
                      controller: y,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton.icon(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          res = double.parse(y.text) * double.parse(x.text);
                        });
                      }
                    },
                    icon: const Icon(Icons.numbers),
                    label: const Text("Calc the Result")),
              ),
              TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        label: const Text("enter height number"),
                        suffixStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                        suffixText: widget.unit,
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "OOPS, is empty:)";
                        }
                        if (double.tryParse(value).isNull) {
                          return "just NUMBER :\$";
                        }
                        return null;
                      },
                      controller: z,
                    ),
                    Container(
                width: double.infinity,
                child: ElevatedButton.icon(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
        
                        var  a = double.parse(y.text) * double.parse(x.text);
                        var  v = double.parse(y.text) * double.parse(x.text) *double.parse(z.text);
                        Navigator.of(context).push(MaterialPageRoute(
                       builder: (context) => Result(unit: widget.unit, a: a,v: v,),
                       ));
                       
                      }
                    },
                    icon: const Icon(Icons.numbers),
                    label: const Text("Calc the Result2")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
