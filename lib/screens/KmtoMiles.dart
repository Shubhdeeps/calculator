import 'package:flutter/material.dart';
import '../components/components.dart';

class KmToMiles extends StatefulWidget {
  const KmToMiles({super.key});

  @override
  State<KmToMiles> createState() => _KmToMilesState();
}

class _KmToMilesState extends State<KmToMiles> {
  List inputValues = [];
  double _output = 0;
  String output = "0";

  void ClickFN(String message) {
    if (message == "C") {
      inputValues.clear();
      output = "0";
      setState(() {
        inputValues.add("");
      });
    } else {
      setState(() {
        inputValues.add(message);
        _output = double.parse(inputValues.join()) * 0.621371;
        var out = _output.toStringAsFixed(2);
        output = "$out Miles";
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
            KeypadKmtoMiles(ClickFN)
          ],
        ),
      ),
    );
    ;
  }
}
