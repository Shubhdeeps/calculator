import 'package:flutter/material.dart';

class ResultField extends StatelessWidget {
  final String output;
  const ResultField(this.output, {super.key});

  @override
  Widget build(BuildContext context) => Container(
        child: Text(output,
            style: const TextStyle(
                color: Color.fromRGBO(252, 255, 243, 1), fontSize: 38)),
      );
}
