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
                            text: 'C', textColor: Colors.red[400]),
                        onPressedInput: clearInput),
                    buildButton(
                        widget: buildButtonText(
                            text: '( )', textColor: Colors.lightGreen[600]),
                        onPressedInput: () => updateInput('parenthesis')),
                    buildButton(
                        widget: buildButtonText(
                            text: '%', textColor: Colors.lightGreen[600]),
                        onPressedInput: () => updateInput('%')),
                    buildButton(
                        widget: buildButtonText(
                            text: '\u00F7',
                            textColor: Colors.lightGreen[600],
                            fontSize: 50,
                            fontWeight: FontWeight.w300),
                        onPressedInput: () => updateInput('/')),
                  ],
                ),
                Row(
                  children: [
                    buildButton(
                        widget: buildButtonText(text: '7'),
                        onPressedInput: () => updateInput('7')),
                    buildButton(
                        widget: buildButtonText(text: '8'),
                        onPressedInput: () => updateInput('8')),
                    buildButton(
                        widget: buildButtonText(text: '9'),
                        onPressedInput: () => updateInput('9')),
                    buildButton(
                        widget: buildButtonText(
                            text: '\u00D7',
                            textColor: Colors.lightGreen[600],
                            fontSize: 50,
                            fontWeight: FontWeight.w300),
                        onPressedInput: () => updateInput('x')),
                  ],
                ),
                Row(
                  children: [
                    buildButton(
                        widget: buildButtonText(text: '4'),
                        onPressedInput: () => updateInput('4')),
                    buildButton(
                        widget: buildButtonText(text: '5'),
                        onPressedInput: () => updateInput('5')),
                    buildButton(
                        widget: buildButtonText(text: '6'),
                        onPressedInput: () => updateInput('6')),
                    buildButton(
                        widget: buildButtonText(
                            text: '\u2212',
                            textColor: Colors.lightGreen[600],
                            fontSize: 50,
                            fontWeight: FontWeight.w300),
                        onPressedInput: () => updateInput('-')),
                  ],
                ),
                Row(
                  children: [
                    buildButton(
                        widget: buildButtonText(text: '1'),
                        onPressedInput: () => updateInput('1')),
                    buildButton(
                        widget: buildButtonText(text: '2'),
                        onPressedInput: () => updateInput('2')),
                    buildButton(
                        widget: buildButtonText(text: '3'),
                        onPressedInput: () => updateInput('3')),
                    buildButton(
                        widget: buildButtonText(
                            text: '\u002b',
                            textColor: Colors.lightGreen[600],
                            fontSize: 50,
                            fontWeight: FontWeight.w300),
                        onPressedInput: () => updateInput('+')),
                  ],
                ),
                Row(
                  children: [
                    buildButton(
                        widget: buildButtonText(text: '+/-'),
                        onPressedInput: () => updateInput('negate')),
                    buildButton(
                        widget: buildButtonText(text: '0'),
                        onPressedInput: () => updateInput('0')),
                    buildButton(
                        widget: buildButtonText(text: '.'),
                        onPressedInput: () => updateInput('.')),
                    buildButton(
                        widget: buildButtonText(
                            text: '\u003d',
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
        } else if (input[input.length - 1] == '%') {
          // do nothing
        } else {
          input += val;
        }
      } else {
        // if inputType is operator
        if (val == 'parenthesis') {
          input = parenthesisLogic(input);
        } else if (input == '0' && val != 'negate' && val != '.') {
          _showToast(context, 'sorry, you should start with a number');
        } else if (val == input[input.length - 1]) {
          // we don't need to show anything in this case
        } else if (isOperator(input, input.length - 1) && isOperator(val, 0)) {
          input = input.substring(0, input.length - 1) + val;
        } else if (val == 'negate') {
          input = negateLogic(input);
        } else if (val == '.') {
          input = decimalLogic(input);
        } else if (val == '%') {
          input = percentageLogic(input);
        } else {
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
        if (openCounter - closeCounter == 1) {
          finalUserInput += ')';
          calculate(finalUserInput);
        } else {
          _showToast(context, 'invalid input');
        }
      } else {
        calculate(finalUserInput);
      }
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

  String parenthesisLogic(String input) {
    if (input == '0') {
      input = '(';
    } else if (double.tryParse(input[input.length - 1]) != null ||
        input[input.length - 1] == ')' ||
        input[input.length - 1] == '%') {
      input += ')';
    } else if (isOperator(input, input.length - 1) ||
        input[input.length - 1] == '(') {
      input += '(';
    }
    return input;
  }

  String negateLogic(String input) {
    int lastIndex = input.length - 1;
    if (input == '0') {
      input = '(-';
    } else if (input.length == 1) {
      input = '(-$input';
    } else if (isOperator(input, lastIndex)) {
      input += '(-';
    } else if (isOperator(input, lastIndex - 1)) {
      input = '${input.substring(0, lastIndex)}(-${input[lastIndex]}';
    } else {
      int index = 0;
      bool isNumOnly = true;
      for (int i = input.length - 1; i >= 0; i--) {
        if (isOperator(input, i)) {
          index = i;
          isNumOnly = false;
          break;
        }
      }
      if (isNumOnly) {
        if (input.substring(0, 2) == '(-') {
          input = input.substring(2);
        } else {
          input = '(-$input';
        }
      } else {
        if (input.substring(index + 1, index + 3) == '(-') {
          input =
              '${input.substring(0, index + 1)}${input.substring(index + 3)}';
        } else {
          input =
              '${input.substring(0, index + 1)}(-${input.substring(index + 1)}';
        }
      }
    }
    return input;
  }

  String decimalLogic(String input) {
    if (input[input.length - 1] == '%') {
      // do nothing
    } else {
      int lastDotIndex = 0;
      bool dotExist = false;
      for (int i = input.length - 1; i >= 0; i--) {
        if (input[i] == '.') {
          dotExist = true;
          lastDotIndex = i;
          break;
        }
      }
      if (!dotExist) {
        input += '.';
      } else {
        int lastOperatorIndex = 0;
        bool operatorExist = false;
        for (int i = input.length - 1; i >= 0; i--) {
          if (isOperator(input, i)) {
            operatorExist = true;
            lastOperatorIndex = i;
            break;
          }
        }
        if (!operatorExist) {
          // do nothing
        } else {
          // if operator exist and dot exist, then compare their lastIndexes.
          if (lastDotIndex > lastOperatorIndex) {
            // do nothing
          } else {
            if (lastOperatorIndex == input.length - 1) {
              input += '0.';
            } else {
              input += '.';
            }
          }
        }
      }
    }
    return input;
  }

  String percentageLogic(String input) {
    // check if character before it is operator
    if (double.tryParse(input[input.length - 1]) != null ||
        input[input.length - 1] == '.') {
      input += '%';
    }
    return input;
  }

  bool isOperator(String text, int index) {
    if (text[index] == 'x' ||
        text[index] == '/' ||
        text[index] == '-' ||
        text[index] == '+' ||
        text[index] == '*') {
      return true;
    } else {
      return false;
    }
  }
  void calculate(String finalUserInput) {
    print('calculate Method test');
    if (finalUserInput.contains('%')) {
      print('there is percentage');
      print(finalUserInput.length);
      int percentageCounter = 0;
      List<int> percentageIndexes = [];

      for (int i = 0; i < finalUserInput.length; i++) {
        if (finalUserInput[i] == '%') {
          percentageCounter++;
          percentageIndexes.add(i);
        }
      }
      print('This is percentage Counter: $percentageCounter');

      print('This is percentage List: $percentageIndexes');


      if (percentageCounter == 0) {
        print('No percentage');
        // do nothing
      } else {
        print(percentageIndexes.length);
        for (int i = 0; i < percentageIndexes.length; i++) {
          String value = '';
          print('outer loop executed');
          for (int m = percentageIndexes[i]; (m >= 0); m--) {
            if (isOperator(finalUserInput, m)) {
              print('exit loop');
              break;
            } else {
              value = finalUserInput[m] + value;
              print('inner loop executed');
            }
          }
          print('this is the value $value');
          String valueConverted = (double.parse(value.substring(0, value.length-1))/100).toString();
          print('this is the ConvertedValue $valueConverted');
          finalUserInput = finalUserInput.replaceFirst(value, valueConverted);
          print('this is the finalUserInput $finalUserInput');
        }
      }
    }


    print (finalUserInput);
    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    if (eval.toString().contains('.') && eval.toString().length > 10) {
      input = num.parse(eval.toStringAsFixed(10)).toString();
    } else {
      input = eval.toString();
    }
  }
}
