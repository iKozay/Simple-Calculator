import 'package:flutter/material.dart';
import './interface_components/DropDown2.dart';

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

  /// this method is called whenever the type of unit conversion is changed using the top drop down menu
  /// this method has is supposed to reset the values in the textFields as well as in the units drop downs.
  void onTypesDropDownChange(value) {
    setState(() {
      dropDownInitialValue = value!;
    });
    unitInitial1 = units[types.indexOf(dropDownInitialValue)][0];
    unitInitial2 = units[types.indexOf(dropDownInitialValue)][0];
  }

  /// this method is called when the first units' drop down has element changed.
  /// the unit appearing in the resultant textField is supposed to change when the user change the value of this dropDown
  void onUnits1Change(value) {
    setState(() {
      unitInitial1 = value!;
    });
  }

  /// this method is called when the second units' drop down has element changed.
  /// the unit appearing in the resultant textField is supposed to change when the user change the value of this dropDown
  void onUnits2Change(value) {
    setState(() {
      unitInitial2 = value!;
    });
  }

  /// this method is called whenever the user change the elements in the first textField.
  /// it is supposed to calculate the the resultant value in the desired unit depending on the user input.
  /// it will use its value, and the values of the units drop downs to accomplish this task
  void onTextField1Change(double number) {
    print('You wrote this: $number');
    setState(() {

    });
  }

  /// this method is called whenever the switch green button is pressed.
  /// it is supposed to switch the values between the 2 textFields as well as the unites in drop down menus
  void switchButtonPressed() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: put your code here for the implementation of the Unit Convertor

    return Container(
      padding: const EdgeInsets.all(30),
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
            margin: const EdgeInsets.only(bottom: 30),
            child: const Text(
              'Unit Convertor',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
          // drop down to determine the type of unit conversion (temperature, measurement)
          Center(
            child: DropDown2(
              width: 200,
              value: dropDownInitialValue,
              dropdownItems: types,
              backgroundColor: Colors.white,
              onChangeHandler: (value) {
                onTypesDropDownChange(value);
              },
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
                      onChanged: (number) {
                        onTextField1Change(double.parse(number));
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
                      child: DropDown2(
                        width: 132.3,
                        backgroundColor: Colors.grey[300],
                        dropdownItems:
                            units[types.indexOf(dropDownInitialValue)],
                        value: unitInitial1,
                        onChangeHandler: (value) {
                          onUnits1Change(value);
                        },
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
                    onPressed: switchButtonPressed,
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
                      child: DropDown2(
                        width: 132.3,
                        backgroundColor: Colors.grey[300],
                        dropdownItems:
                            units[types.indexOf(dropDownInitialValue)],
                        value: unitInitial2,
                        onChangeHandler: (value) {
                          onUnits2Change(value);
                        },
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
