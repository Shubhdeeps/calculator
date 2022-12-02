import 'package:flutter/material.dart';
import '../components/components.dart';
import '../services/history.dart';

class KmToMiles extends StatefulWidget {
  const KmToMiles({super.key});

  @override
  State<KmToMiles> createState() => _KmToMilesState();
}

class _KmToMilesState extends State<KmToMiles> {
  List inputValues = [];
  double _output = 0;
  String output = "0 Miles";

  void convert() {
    print("convert btn");
    //performing function to calcalte the miles
    _output = double.parse(inputValues.join("")) * 0.621371;
    var out = _output.toStringAsFixed(3);
    output = "$out Miles";
    var input = inputValues.join("");
    setPersistData("$input km = $output");
    setState(() {
      inputValues = [];
    });
  }

  void clickFN(String message) {
    if (message == "C") {
      output = "0 Miles";
      setState(() {
        inputValues.clear();
      });
    } else {
      setState(() {
        if (inputValues.isEmpty && message == ".") {
          inputValues.add(0);
        }
        if (inputValues.contains(".") && message == ".") {
          return;
        }
        // adding new value to our input array.
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
            const SizedBox(height: 30),
            ResultField(output),
            const SizedBox(height: 20),
            InputField(
              inputValues.isNotEmpty ? [...inputValues, " km"] : [0, " km"],
            ),
            TextButton(
              onPressed: () => convert(),
              child: const Text("Convert",
                  style: TextStyle(
                      color: Color.fromRGBO(252, 255, 243, 1), fontSize: 38)),
            ),
            KeypadKmtoMiles(clickFN)
          ],
        ),
      ),
    );
    ;
  }
}
