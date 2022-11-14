import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  String input = '0';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
            child: SelectableText(
              input,
              style: TextStyle(
                fontSize: 50,
                color: Colors.grey[900],
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      const Spacer(),
                      const Spacer(),
                      const Spacer(),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: backspaceInput,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.grey[100],
                            shape: const CircleBorder(),
                            minimumSize: Size(
                                0.2 * MediaQuery.of(context).size.width,
                                0.1 * MediaQuery.of(context).size.height),
                            //padding: const EdgeInsets.all(40),
                            //alignment: Alignment.centerRight,
                          ),
                          child: const Icon(
                            color: Color(0xFF7CB342),
                            Icons.backspace_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    buildButton(
                        widget: buildButtonText(
                            text: "C", textColor: Colors.red[400]),
                        onPressedInput: clearInput),
                    buildButton(
                        widget: buildButtonText(
                            text: "( )", textColor: Colors.lightGreen[600]),
                        onPressedInput: () => updateInput("parenthesis")),
                    buildButton(
                        widget: buildButtonText(
                            text: "%", textColor: Colors.lightGreen[600]),
                        onPressedInput: () => updateInput("percentage")),
                    buildButton(
                        widget: buildButtonText(
                            text: "\u00F7",
                            textColor: Colors.lightGreen[600],
                            fontSize: 50,
                            fontWeight: FontWeight.w300),
                        onPressedInput: () => updateInput("division")),
                  ],
                ),
                Row(
                  children: [
                    buildButton(
                        widget: buildButtonText(text: "7"),
                        onPressedInput: () => updateInput("7")),
                    buildButton(
                        widget: buildButtonText(text: "8"),
                        onPressedInput: () => updateInput("8")),
                    buildButton(
                        widget: buildButtonText(text: "9"),
                        onPressedInput: () => updateInput("9")),
                    buildButton(
                        widget: buildButtonText(
                            text: "\u00D7",
                            textColor: Colors.lightGreen[600],
                            fontSize: 50,
                            fontWeight: FontWeight.w300),
                        onPressedInput: () => updateInput("multiplication")),
                  ],
                ),
                Row(
                  children: [
                    buildButton(
                        widget: buildButtonText(text: "4"),
                        onPressedInput: () => updateInput("4")),
                    buildButton(
                        widget: buildButtonText(text: "5"),
                        onPressedInput: () => updateInput("5")),
                    buildButton(
                        widget: buildButtonText(text: "6"),
                        onPressedInput: () => updateInput("6")),
                    buildButton(
                        widget: buildButtonText(
                            text: "\u2212",
                            textColor: Colors.lightGreen[600],
                            fontSize: 50,
                            fontWeight: FontWeight.w300),
                        onPressedInput: () => updateInput("subtraction")),
                  ],
                ),
                Row(
                  children: [
                    buildButton(
                        widget: buildButtonText(text: "1"),
                        onPressedInput: () => updateInput("1")),
                    buildButton(
                        widget: buildButtonText(text: "2"),
                        onPressedInput: () => updateInput("2")),
                    buildButton(
                        widget: buildButtonText(text: "3"),
                        onPressedInput: () => updateInput("3")),
                    buildButton(
                        widget: buildButtonText(
                            text: "\u002b",
                            textColor: Colors.lightGreen[600],
                            fontSize: 50,
                            fontWeight: FontWeight.w300),
                        onPressedInput: () => updateInput("addition")),
                  ],
                ),
                Row(
                  children: [
                    buildButton(
                        widget: buildButtonText(text: "+/-"),
                        onPressedInput: () => updateInput("negate")),
                    buildButton(
                        widget: buildButtonText(text: "0"),
                        onPressedInput: () => updateInput("0")),
                    buildButton(
                        widget: buildButtonText(text: "."),
                        onPressedInput: () => updateInput("decimal")),
                    buildButton(
                        widget: buildButtonText(
                            text: "\u003d",
                            textColor: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w300),
                        onPressedInput: getResult,
                        backgroundColor: Colors.lightGreen[600]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildButton(
      {required Widget widget,
      required void Function() onPressedInput,
      Color? backgroundColor = const Color(0xFFF5F5F5)}) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ElevatedButton(
          onPressed: onPressedInput,
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: backgroundColor,
              shape: const CircleBorder(),
              minimumSize: Size(0.2 * MediaQuery.of(context).size.width,
                  0.1 * MediaQuery.of(context).size.height)),
          child: widget,
        ),
      ),
    );
  }

  Text buildButtonText(
      {required String text,
      Color? textColor = const Color(0xFF616161),
      double? fontSize = 30,
      FontWeight? fontWeight = FontWeight.w400}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize, color: textColor, fontWeight: fontWeight),
    );
  }

  void updateInput(String val) {
    setState(() {
      input += val;
      // TODO : add logic to update input
      // TODO : manage the input as you would like
    });
  }

  void clearInput() {
    setState(() {
      input = '0';
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
