import 'package:flutter/material.dart';

class SignButtonsStretched extends StatelessWidget {
  final String icon;
  final void Function(String) ClickFN;
  const SignButtonsStretched(this.icon, this.ClickFN, {super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => ClickFN(icon),
        child: Container(
            width: 170,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              gradient: const LinearGradient(
                  colors: [
                    Color(0xFFF6388E),
                    Color(0xFFFB79A2),
                  ],
                  begin: FractionalOffset(0.5, 1.0),
                  end: FractionalOffset(0.5, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: TextButton(
              onPressed: null,
              child: Text(icon,
                  style: const TextStyle(
                      color: Color.fromRGBO(252, 255, 243, 1), fontSize: 38)),
            )),
      );
}
