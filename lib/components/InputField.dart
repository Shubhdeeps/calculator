import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final List inputValues;
  const InputField(this.inputValues, {super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: const Color(0xFF1D2E48),
        ),
        height: 55,
        child: Text(
          inputValues.join(""),
          style: const TextStyle(
              color: Color.fromRGBO(252, 255, 243, 1), fontSize: 22),
        ),
      );
}
