import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
                        onPressedInput: () => updateInput(")")),
                    buildButton(
                        widget: buildButtonText(
                            text: "%", textColor: Colors.lightGreen[600]),
                        onPressedInput: () => updateInput("%")),
                    buildButton(
                        widget: buildButtonText(
                            text: "\u00F7",
                            textColor: Colors.lightGreen[600],
                            fontSize: 50,
                            fontWeight: FontWeight.w300),
                        onPressedInput: () => updateInput("/")),
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
                        onPressedInput: () => updateInput("x")),
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
                        onPressedInput: () => updateInput("-")),
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
                        onPressedInput: () => updateInput("+")),
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
                        onPressedInput: () => updateInput(".")),
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
    String inputType;
    if (double.tryParse(val) != null) {
      inputType = 'numeric';
    } else {
      inputType = 'operator';
    }

    setState(() {
      if (inputType == 'numeric') {
        if (input == '0') {
          input = val;
        } else {
          input += val;
        }
      } else {
        // if inputType is operator
        if (input == '0' && val != '(-' && val != '(') {
          _showToast(context, 'sorry, you should start with a number');
        } else if (val == input[input.length - 1]) {
          _showToast(context, 'invalid input');
        } else if (isOperator(input, input.length-1, false) && isOperator(val, 0, false)) {
          input = input.substring(0, input.length-1) + val;
        } else if (val == 'negate') {
          int lastIndex = input.length - 1;
          if (input.length == 1) {
            input = '(-$input';
          } else if (isOperator(input, lastIndex, true)) {
            input += '(-';
          } else if (isOperator(input, lastIndex-1, false)) {
            input = '${input.substring(0, lastIndex)}(-${input[lastIndex]}';

          } else {
            int index = 0;
            bool isNumOnly = true;
            for (int i = input.length - 1; i >= 0; i--) {
              if (isOperator(input, i, true)) {
                index = i;
                isNumOnly = false;
                break;
              }
            }
            if (isNumOnly) {
              print('This is the input isNumOnly ' + input);
              if (input.substring(0, 2) == '(-') {
                input = input.substring(2);
              } else {
                input = '(-$input';
              }
            } else {
              print('This is the input contain operator ' + input);
              if (input.substring(index + 1, index + 3) == '(-') {
                input =
                    '${input.substring(0, index + 1)}${input.substring(index + 3)}';
              } else {
                input =
                    '${input.substring(0, index + 1)}(-${input.substring(index + 1)}';
              }
            }
          }
        }
        // else if () {
        //
        // }
        else {
          input += val;
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
      if (input.length > 1) {
        input = input.substring(0, input.length - 1);
      } else if (input.length == 1) {
        input = '0';
      }
    });
  }

  void getResult() {
    setState(() {
      // TODO : Add logic to get result
      // TODO : Use a library to evaluate the expression or write your own algorithm. I suggest using the first option.

      String finalUserInput = input;
      finalUserInput = finalUserInput.replaceAll('x', '*');

      // checking if parenthesis are well written
      int openCounter = 0;
      int closeCounter = 0;
      for (int i = 0; i < finalUserInput.length; i++) {
        if (finalUserInput[i] == '(') {
          openCounter++;
        } else if (finalUserInput[i] == ')') {
          closeCounter++;
        }
      }
      if (openCounter != closeCounter) {
        if (closeCounter < openCounter) {
          finalUserInput+= ')';
        }
      }

      // if (double.tryParse(finalUserInput[finalUserInput.length - 1]) != null) {
      //   _showToast(context, 'invalid format used');
      // } else {
        Parser p = Parser();
        Expression exp = p.parse(finalUserInput);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        input = eval.toString();
      //}
    });
  }

  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  bool isOperator(String text, int index, bool checkParenthesis) {

    bool verify = (checkParenthesis) ? (text[index - 1] != '(') : true;

    if (text[index] == 'x' ||
        text[index] == '/' ||
        (text[index] == '-' && verify) ||
        text[index] == '+') {
      return true;
    } else {
      return false;
    }
  }
}
