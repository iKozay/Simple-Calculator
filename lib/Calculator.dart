import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  String input = '0';

  // Change this factor to change the size of digits on screen
  double inputScaleFactor = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: SelectableText(
              input,
              style: const TextStyle(fontSize: 70, color: Colors.black,),
              textScaleFactor: inputScaleFactor,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: backspaceInput,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.grey[500],
                    shape: const CircleBorder(),
                    minimumSize: Size(0.243*MediaQuery.of(context).size.width, 0.12*MediaQuery.of(context).size.height)),
                child: const Icon(Icons.backspace_outlined),
              ),
              Row(
                children: [
                  buildButton(buildButtonText("C", Colors.red[400]), clearInput, Colors.white),
                  buildButton(buildButtonText("()", Colors.green[500]), () => updateInput("parenthesis"), Colors.white),
                  buildButton(buildButtonText("%", Colors.green[500]), () => updateInput("percentage"), Colors.white),
                  buildButton(buildButtonText("\u00F7", Colors.green[500]), () => updateInput("division"), Colors.white),
                ],
              ),
              Row(
                children: [
                  buildButton(buildButtonText("7", Colors.black87), () => updateInput("7"), Colors.white),
                  buildButton(buildButtonText("8", Colors.black87), () => updateInput("8"), Colors.white),
                  buildButton(buildButtonText("9", Colors.black87), () => updateInput("9"), Colors.white),
                  buildButton(buildButtonText("\u00D7", Colors.green[500]), () => updateInput("multiplication"), Colors.white),
                ],
              ),
              Row(
                children: [
                  buildButton(buildButtonText("4", Colors.black87), () => updateInput("4"), Colors.white),
                  buildButton(buildButtonText("5", Colors.black87), () => updateInput("5"), Colors.white),
                  buildButton(buildButtonText("6", Colors.black87), () => updateInput("6"), Colors.white),
                  buildButton(buildButtonText("-", Colors.green[500]), () => updateInput("subtraction"), Colors.white),
                ],
              ),
              Row(
                children: [
                  buildButton(buildButtonText("1", Colors.black87), () => updateInput("1"), Colors.white),
                  buildButton(buildButtonText("2", Colors.black87), () => updateInput("2"), Colors.white),
                  buildButton(buildButtonText("3", Colors.black87), () => updateInput("3"), Colors.white),
                  buildButton(buildButtonText("+", Colors.green[500]), () => updateInput("addition"), Colors.white),
                ],
              ),
              Row(
                children: [
                  buildButton(buildButtonText("+/-", Colors.black87), () => updateInput("negate"), Colors.white),
                  buildButton(buildButtonText("0", Colors.black87), () => updateInput("0"), Colors.white),
                  buildButton(buildButtonText(".", Colors.black87), () => updateInput("decimal"), Colors.white),
                  buildButton(buildButtonText("=", Colors.white), getResult, Colors.green[500]),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Expanded buildButton(Widget widget, void Function() onPressedInput, Color? backgroundColor) {
    return Expanded(
      flex: 4,
      child: ElevatedButton(
        onPressed: onPressedInput,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: const CircleBorder(),
            minimumSize: Size(0.243*MediaQuery.of(context).size.width, 0.12*MediaQuery.of(context).size.height)),
        child: widget,
      ),
    );
  }
  Text buildButtonText(String text, Color? textColor){
    return Text(text,
      style: TextStyle(fontSize: 30, color: textColor),);
  }

  void updateInput(String val) {
    setState(() {
      input+=val;
      // TODO : add logic to update input
      // TODO : manage the input as you would like
    });
  }

  void clearInput() {
    setState(() {
      // TODO: Add clear input
    });
  }

  void backspaceInput() {
    setState(() {
      // TODO: Add backspace functionality
    });
  }

  void getResult() {
    setState(() {
      // TODO : Add logic to get result
      // TODO : Use a library to evaluate the expression or write your own algorithm. I suggest using the first option.
    });
  }

}
