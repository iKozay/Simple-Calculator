import 'package:flutter/material.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';

class Convertor extends StatefulWidget {
  const Convertor({super.key});

  @override
  _ConvertorState createState() => _ConvertorState();
}

class _ConvertorState extends State<Convertor> {

  /*
   * The following variable will hold the value of the
   * converted measurement: ex if user input 1 m, and final unit is
   * cm, then this variable will hold 100
   */
  double finalValue = 0.0;

  // initial units displayed to the user
  String unitInitial1 = 'Celsius';
  String unitInitial2 = 'Celsius';
  String dropDownInitialValue = 'Temperature';
  // unit convertor types
  var types = ['Temperature', 'Measurement'];
  // list of unites
  var units = [
    ['Celsius', 'kelvin', 'Fahrenheit'],
    ['cm', 'm', 'inch', 'feet', 'miles', 'm'],
  ];

  void onTextFieldChange(num) {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: put your code here for the implementation of the Unit Convertor

    return Container(
      padding: const EdgeInsets.all(35),
      decoration: const BoxDecoration(
        color: Color(0xFFEFFFDA),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Page Title
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 40),
            child: const Text(
              'Unit Convertor',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
          // drop down to determine the type of unit conversion (temperature, measurement)
          Center(
            child: CustomDropdownButton2(
              buttonWidth: 200,
              buttonHeight: 55,
              dropdownWidth: 200,
              hint: 'Select Item',
              dropdownItems: types,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 25,
              value: dropDownInitialValue,
              onChanged: (value) {
                setState(() {
                  dropDownInitialValue = value!;
                });
                unitInitial1 = units[types.indexOf(dropDownInitialValue)][0];
                unitInitial2 = units[types.indexOf(dropDownInitialValue)][0];
              },
              buttonPadding: const EdgeInsets.only(left: 20, right: 10),
              buttonDecoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(1, 3) // changes position of shadow
                      ),
                ],
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              dropdownElevation: 8,
              scrollbarRadius: const Radius.circular(40),
              dropdownDecoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3) // changes position of shadow
                      ),
                ],
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          // informative text
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20, top: 40),
            child: const Text(
              'Please enter the measurement and specify the units',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16),
            ),
          ),

          // first row
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // first textField
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (num) {
                        onTextFieldChange(num);
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 2, color: Colors.blueAccent),
                        ),
                        hintText: '0.0',
                        hintStyle: const TextStyle(fontSize: 18),
                        contentPadding: const EdgeInsets.only(
                            left: 15, right: 20, top: 17, bottom: 17),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                // first units drop down
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: CustomDropdownButton2(
                        buttonHeight: 60,
                        hint: 'Select Item',
                        value: unitInitial1,
                        dropdownItems:
                            units[types.indexOf(dropDownInitialValue)],
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 25,
                        onChanged: (value) {
                          setState(() {
                            unitInitial1 = value!;
                          });
                        },
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
                        buttonDecoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(
                                  1, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.grey[300],
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        dropdownDecoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /*
           * this button will convert the value of the result
           * and put it in the first textField. It will also swap
           * the units.
           */
          Container(
            transformAlignment: Alignment.centerLeft,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA7D486),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(13),
                    ),
                    child: const Icon(
                      Icons.compare_arrows_outlined,
                      size: 34,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // second row
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // second textField
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 2, color: Colors.blueAccent),
                        ),
                        hintText: '0.0',
                        hintStyle: const TextStyle(fontSize: 18),
                        contentPadding: const EdgeInsets.only(
                            left: 15, right: 20, top: 17, bottom: 17),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                // second unit drop down
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: CustomDropdownButton2(
                        buttonHeight: 60,
                        hint: 'Select Item',
                        value: unitInitial2,
                        dropdownItems:
                            units[types.indexOf(dropDownInitialValue)],
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 25,
                        onChanged: (value) {
                          setState(() {
                            unitInitial2 = value!;
                          });
                        },
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
                        buttonDecoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: const Offset(
                                    1, 3) // changes position of shadow
                                ),
                          ],
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.grey[300],
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        dropdownDecoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3) // changes position of shadow
                                ),
                          ],
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
