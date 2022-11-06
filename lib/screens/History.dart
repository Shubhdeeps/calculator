import 'package:flutter/material.dart';
import '../components/components.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<String> history_items = [];

  @override
  void initState() {
    super.initState();

    getPersistData();
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
                  onPressed: () => clearPersistData(),
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
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text(
                  history,
                  style: const TextStyle(
                      color: Color.fromRGBO(252, 255, 243, 1), fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getPersistData() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('calculations');
    setState(() {
      history_items = items ?? [];
    });
  }

  void clearPersistData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('calculations');
    setState(() {
      history_items = [];
    });
  }
}
