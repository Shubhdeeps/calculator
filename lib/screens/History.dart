import 'package:flutter/material.dart';
import '../services/history.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<String> history_items = [];

  @override
  initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "History",
                  style: TextStyle(
                      color: Color.fromRGBO(252, 255, 243, 1), fontSize: 28),
                ),
                TextButton(
                  onPressed: () => clearData(),
                  child: const Text(
                    "Clear History",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
            ...history_items.map(
              (history) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF1D2E48),
                ),
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                padding: const EdgeInsets.fromLTRB(25, 10, 20, 10),
                child: Text(
                  history,
                  style: const TextStyle(
                      color: Color.fromRGBO(252, 255, 243, 1), fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getData() async {
    var items = await getPersistData();
    setState(() {
      history_items = items as List<String>;
    });
  }

  void clearData() async {
    clearPersistData();
    setState(() {
      history_items = [];
    });
  }
}
