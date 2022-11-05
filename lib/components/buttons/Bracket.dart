import 'package:flutter/material.dart';

class Brackets extends StatelessWidget {
  final String type;
  final void Function(String) ClickFN;
  const Brackets(this.type, this.ClickFN, {super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => ClickFN(type),
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Color(0xFF1D2E48),
          ),
          height: 55,
          child: Text(type,
              style: const TextStyle(
                  color: Color.fromRGBO(252, 255, 243, 1), fontSize: 32)),
        ),
      );
}
