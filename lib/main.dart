import 'package:flutter/material.dart';

void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final _pageOptions = [
    Calculator(),
    Convertor(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate, size: 30),
              label: 'calculator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.app_registration_rounded, size: 30),
              label: 'unit convertor',
            ),
          ],
          selectedItemColor: Colors.green,
          elevation: 5.0,
          unselectedItemColor: Colors.green[900],
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  CalculatorState createState() => CalculatorState();
}
class CalculatorState extends State<Calculator>{
  String input = '0';

  void updateInput(String val) {
    setState(() {
      if(val == 'percentage'){
        // get result then divide by 100
      }else if(val == 'parentheses'){

      }else if(val == 'negative'){

      }else if(val == 'dot'){

      }else{
        if(input == '0') {
          input = val;
        }else {
          input = input + val;
        }
      }
    });
  }
  void clearInput() {
    setState(() {
      input = '0';
    });
  }
  void backspaceInput() {
    setState(() {
      if(input.length>1){
        input = input.substring(0, input.length-1);
      }
      else{
        input = '0';
      }
    });
  }
  void getResult() {
    setState(() {
      input = "Result";
    });
  }
  @override
  Widget build(BuildContext context) {



    return Container(
      color: Colors.lightBlue[100],
      child: Column(
        children: [
          Text(input, style: const TextStyle(fontSize: 50, color: Colors.black),textAlign: TextAlign.right,),
          Column(
            children: [
              Row(
                children: [
                  ElevatedButton(onPressed: backspaceInput, child: const Icon(Icons.backspace_outlined)),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: clearInput, child: const Text("C")),
                  ElevatedButton(onPressed: () => updateInput("parentheses"), child: const Text("()")),
                  ElevatedButton(onPressed: () => updateInput("percentage"), child: const Text("%")),
                  ElevatedButton(onPressed: () => updateInput("/"), child: const Text("\u00F7")),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: () => updateInput("7"), child: const Text("7")),
                  ElevatedButton(onPressed: () => updateInput("8"), child: const Text("8")),
                  ElevatedButton(onPressed: () => updateInput("9"), child: const Text("9")),
                  ElevatedButton(onPressed: () => updateInput("*"), child: const Text("X")),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: () => updateInput("4"), child: const Text("4")),
                  ElevatedButton(onPressed: () => updateInput("5"), child: const Text("5")),
                  ElevatedButton(onPressed: () => updateInput("6"), child: const Text("6")),
                  ElevatedButton(onPressed: () => updateInput("-"), child: const Text("-")),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: () => updateInput("1"), child: const Text("1")),
                  ElevatedButton(onPressed: () => updateInput("2"), child: const Text("2")),
                  ElevatedButton(onPressed: () => updateInput("3"), child: const Text("3")),
                  ElevatedButton(onPressed: () => updateInput("+"), child: const Text("+")),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: () => updateInput("negative"), child: const Text("+/-")),
                  ElevatedButton(onPressed: () => updateInput("0"), child: const Text("0")),
                  ElevatedButton(onPressed: () => updateInput("dot"), child: const Text(".")),
                  ElevatedButton(onPressed: getResult, child: const Text("=")),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class Convertor extends StatelessWidget {
  const Convertor({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: put your code here for the implementation of the Convertor
    return Container(
      // I have add the next color just to visualize that the container changes when changing the buttons
      // We will certainly change it later.
      color: Colors.lightGreenAccent[100],
    );
  }
}
