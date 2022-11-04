import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
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
                const SizedBox(height: 40),
                Container(
                  child: const Text("5 + 7 = 12",
                      style: TextStyle(
                          color: Color.fromRGBO(252, 255, 243, 1),
                          fontSize: 38)),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [Brackets("("), Brackets(")")],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Wrap(
                          direction: Axis.vertical,
                          spacing: 50,
                          children: [
                            Wrap(
                              spacing: 50,
                              children: const [
                                NumberText("7"),
                                NumberText("8"),
                                NumberText("9"),
                              ],
                            ),
                            Wrap(
                              spacing: 50,
                              children: const [
                                NumberText("4"),
                                NumberText("5"),
                                NumberText("6"),
                              ],
                            ),
                            Wrap(
                              spacing: 50,
                              children: const [
                                NumberText("1"),
                                NumberText("2"),
                                NumberText("3"),
                              ],
                            ),
                            Wrap(
                              spacing: 50,
                              children: const [
                                NumberText("0"),
                                NumberText(" ."),
                                NumberText("C"),
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
                              children: const [
                                SignButtons(Icons.remove),
                                SignButtons(Icons.percent_sharp)
                              ],
                            ),
                            Wrap(
                              spacing: 50,
                              children: [
                                Wrap(
                                  spacing: 30,
                                  direction: Axis.vertical,
                                  children: const [
                                    SignButtonsStretchedVerticle(Icons.add)
                                  ],
                                ),
                                Wrap(
                                  spacing: 30,
                                  direction: Axis.vertical,
                                  children: const [
                                    SignButtons(Icons.close),
                                    SignButtons(Icons.percent_rounded)
                                  ],
                                ),
                              ],
                            ),
                            Wrap(
                              children: const [SignButtonsStretched("=")],
                            ),
                          ],
                        ),
                      ),
                    ]),
              ],
            )));
  }
}

class Brackets extends StatelessWidget {
  final String type;
  const Brackets(this.type, {super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
        child: Text(type,
            style: const TextStyle(
                color: Color.fromRGBO(252, 255, 243, 1), fontSize: 32)),
      );
}

class NumberText extends StatelessWidget {
  final String title;
  const NumberText(this.title, {super.key});

  @override
  Widget build(BuildContext context) => Container(
        child: Text(title,
            style: const TextStyle(
                color: Color.fromRGBO(252, 255, 243, 1), fontSize: 38)),
      );
}

class SignButtons extends StatelessWidget {
  final IconData icon;
  const SignButtons(this.icon, {super.key});

  @override
  Widget build(BuildContext context) => Container(
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
            data: const IconThemeData(color: Color.fromRGBO(252, 255, 243, 1)),
            child: Icon(icon)),
      ));
}

class SignButtonsStretched extends StatelessWidget {
  final String icon;
  const SignButtonsStretched(this.icon, {super.key});

  @override
  Widget build(BuildContext context) => Container(
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
      ));
}

class SignButtonsStretchedVerticle extends StatelessWidget {
  final IconData icon;
  const SignButtonsStretchedVerticle(this.icon, {super.key});

  @override
  Widget build(BuildContext context) => Container(
      height: 150,
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
            data: const IconThemeData(color: Color.fromRGBO(252, 255, 243, 1)),
            child: Icon(icon)),
      ));
}
