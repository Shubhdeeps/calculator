import 'package:flutter/material.dart';

class NumberText extends StatelessWidget {
  final String title;
  final void Function(String) ClickFN;
  const NumberText(this.title, this.ClickFN, {super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => ClickFN(title),
        child: Container(
          child: Text(title,
              style: const TextStyle(
                  color: Color.fromRGBO(252, 255, 243, 1), fontSize: 38)),
        ),
      );
}
