import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(MaterialApp(home: PageView(children: <Widget>[Home(), KmToMiles()])));
}
