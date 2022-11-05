import 'package:flutter/material.dart';

class SignButtons extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function(String) ClickFN;
  const SignButtons(this.icon, this.text, this.ClickFN, {super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: (() => ClickFN(text)),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            gradient: const LinearGradient(
                colors: [
                  Color(0xFFFC6A6D),
                  Color(0xFFF4C06D),
                ],
                begin: FractionalOffset(0.5, 1.0),
                end: FractionalOffset(0.5, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: TextButton(
            onPressed: null,
            child: IconTheme(
                data: const IconThemeData(
                    color: Color.fromRGBO(252, 255, 243, 1)),
                child: Icon(icon)),
          ),
        ),
      );
}
