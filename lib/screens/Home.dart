import 'package:flutter/material.dart';
import '../components/components.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List inputValues = [];
  String output = "0";

  void ClickFN(String message) {
    if (message == "C") {
      output = "0";
      setState(() {
        inputValues.clear();
      });
    } else if (message == "=") {
      output = inputValues.join("");
      setState(() {
        inputValues.clear();
      });
    } else {
      setState(() {
        inputValues.add(message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF1A2940),
                Color(0xFF2A4767),
              ],
              begin: FractionalOffset(0.5, 1.0),
              end: FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 40),
            ResultField(output),
            const SizedBox(height: 40),
            InputField(inputValues),
            Keypad(ClickFN)
          ],
        ),
      ),
    );
    ;
  }
}
