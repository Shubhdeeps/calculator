import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/components.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.signInAnonymously();
  runApp(
    const MaterialApp(home: Main()),
  );
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int pageValue = 0;

  void pageValuefn(int value) {
    setState(() {
      pageValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Navbar(pageValue),
      ),
      body: Pages(pageValuefn),
    );
  }
}

class Pages extends StatelessWidget {
  Function pageValue;
  Pages(this.pageValue, {super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (value) => pageValue(value),
      children: <Widget>[Home(), KmToMiles(), History()],
    );
  }
}
