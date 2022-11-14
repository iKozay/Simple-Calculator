import 'package:flutter/material.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';

class DropDown2 extends StatelessWidget {
  final Function onChangeHandler;
  final double width;
  final Color? backgroundColor;
  final String value;
  final List<String> dropdownItems;

  const DropDown2({
    super.key,
    required this.onChangeHandler,
    required this.backgroundColor,
    required this.value,
    required this.width,
    required this.dropdownItems,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDropdownButton2(
      buttonWidth: width,
      dropdownWidth: width,
      buttonHeight: 60,
      hint: 'Select Item',
      value: value,
      dropdownItems: dropdownItems,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 25,
      onChanged: (value) {
        onChangeHandler(value);
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
        color: backgroundColor,
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
    );
  }
}
