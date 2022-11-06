import 'dart:developer';

import 'package:function_tree/function_tree.dart';
import 'package:flutter/material.dart';
import '../components/components.dart';
import '../services/history.dart';

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
      setState(() {
        inputValues.clear();
      });
    } else if (message == "=") {
      var equation = inputValues.join("");
      var result = equation.interpret();
      output = "$equation = $result";
      var now = DateTime.now();
      var formatedNow = now.toString().substring(0, 16);
      setPersistData("$output on $formatedNow");
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
            const SizedBox(height: 10),
            ResultField(output),
            InputField(inputValues),
            Keypad(ClickFN)
          ],
        ),
      ),
    );
    ;
  }
}
