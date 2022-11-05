import 'package:flutter/material.dart';
import 'buttons/buttons.dart';

class Keypad extends StatelessWidget {
  final void Function(String) ClickFN;
  const Keypad(this.ClickFN);

  @override
  Widget build(BuildContext context) => Container(
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(child: Brackets("(", ClickFN)),
            Expanded(child: Brackets(")", ClickFN))
          ]),
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
            Container(
              padding: EdgeInsets.all(5),
              child: Wrap(
                spacing: 30,
                direction: Axis.vertical,
                children: [
                  Wrap(
                    spacing: 50,
                    children: [
                      SignButtons(Icons.remove, "-", ClickFN),
                      SignButtons(Icons.percent_sharp, "%", ClickFN)
                    ],
                  ),
                  Wrap(
                    spacing: 50,
                    children: [
                      Wrap(
                        spacing: 30,
                        direction: Axis.vertical,
                        children: [SignButtonsStretchedVerticle(ClickFN)],
                      ),
                      Wrap(
                        spacing: 30,
                        direction: Axis.vertical,
                        children: [
                          SignButtons(Icons.close, "*", ClickFN),
                          SignButtons(Icons.percent_rounded, "/", ClickFN)
                        ],
                      ),
                    ],
                  ),
                  Wrap(
                    children: [SignButtonsStretched("=", ClickFN)],
                  ),
                ],
              ),
            ),
          ]),
        ]),
      );
}
