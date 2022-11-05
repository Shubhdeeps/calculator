import 'package:flutter/material.dart';
import 'buttons/buttons.dart';

class KeypadKmtoMiles extends StatelessWidget {
  final void Function(String) ClickFN;
  const KeypadKmtoMiles(this.ClickFN);

  @override
  Widget build(BuildContext context) => Container(
        child: Column(children: [
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              child: Wrap(
                direction: Axis.vertical,
                spacing: 50,
                children: [
                  Wrap(
                    spacing: 50,
                    children: [
                      NumberText("7", ClickFN),
                      NumberText("8", ClickFN),
                      NumberText("9", ClickFN),
                    ],
                  ),
                  Wrap(
                    spacing: 50,
                    children: [
                      NumberText("4", ClickFN),
                      NumberText("5", ClickFN),
                      NumberText("6", ClickFN),
                    ],
                  ),
                  Wrap(
                    spacing: 50,
                    children: [
                      NumberText("1", ClickFN),
                      NumberText("2", ClickFN),
                      NumberText("3", ClickFN),
                    ],
                  ),
                  Wrap(
                    spacing: 50,
                    children: [
                      NumberText("0", ClickFN),
                      NumberText(".", ClickFN),
                      NumberText("C", ClickFN),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ]),
      );
}
