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

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: put your code here for the implementation of the calculator
    return Container(
      // I have add the next color just to visualize that the container changes when changing the buttons
      // We will certainly change it later.
      color: Colors.lightBlue[100],
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
