import 'package:flutter/material.dart';
import 'Calculator.dart';
import 'Convertor.dart';

void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 1;

  final _pageOptions = [
    const Calculator(),
    const Convertor(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate, size: 30),
              label: 'Calculator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.app_registration_rounded, size: 30),
              label: 'Unit Convertor',
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

