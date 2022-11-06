import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final int type;
  const Navbar(this.type, {super.key});
  static const colorsActive = 0xFFF3B24A;
  static const colorsInactive = 0xFFCCCCCC;
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: IconTheme(
                data: IconThemeData(
                    color: Color((type == 0) ? colorsActive : colorsInactive)),
                child: Icon(Icons.calculate)),
          ),
          Container(
            child: IconTheme(
                data: IconThemeData(
                    color: Color((type == 1) ? colorsActive : colorsInactive)),
                child: Icon(Icons.functions)),
          ),
          Container(
            child: IconTheme(
                data: IconThemeData(
                    color: Color((type == 2) ? colorsActive : colorsInactive)),
                child: Icon(Icons.history)),
          ),
        ],
      );
}
