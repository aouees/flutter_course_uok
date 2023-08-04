
import 'package:flutter/material.dart';

class Week1 extends StatefulWidget {
  const Week1({super.key});
  @override
  State<Week1> createState() => _Week1State();
}

class _Week1State extends State<Week1> {
  var num1=TextEditingController();
  var num2=TextEditingController();
  String? op="";
  double res=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Week 1")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${num1.text} $op ${num2.text} = $res",style: const TextStyle(fontSize: 25),),
          const SizedBox(height: 25,),
          Row(
            children: [
              Expanded(flex: 3,child: TextFormField(controller: num1,textAlign: TextAlign.center,keyboardType:const TextInputType.numberWithOptions()),),
              const SizedBox(width: 10,),
              Expanded(
                flex: 1,
                child: DropdownButtonFormField(
                  alignment: AlignmentDirectional.center,
                  items: const [
                  DropdownMenuItem(
                    value: "*",
                    child: Text("*"),
                  ),
                  DropdownMenuItem(
                    value: "+",
                    child: Text("+"),
                  ),
                  DropdownMenuItem(
                    value: "÷",
                    child: Text("÷"),
                  ),
                  DropdownMenuItem(
                    value: "-",
                    child: Text("-"),
                  ),
                ],
                  onChanged: (value) {
                  op=value;
                  },
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(flex: 3,child: TextFormField(controller: num2,textAlign: TextAlign.center,
              keyboardType:const TextInputType.numberWithOptions()),)
            ],
          ),
          const SizedBox(height: 25,),
          ElevatedButton(onPressed: (){
            calc(double.parse(num1.text), op, double.parse(num2.text));
          }, child: const Text("Calc"))
        ],
      ),
    );
  }

  calc(num1,op,num2){
    if(num1!=null && num2 !=null && op!=null){
      switch (op){
        case '*':
          res=num1*num2;
          break;
        case '÷':
          res=num1/num2;
          break;
        case '+':
          res=num1+num2;
          break;
        case '-':
          res=num1-num2;
          break;
      }
      setState(() {
      });
    }
  }
}
