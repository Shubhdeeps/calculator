import 'package:shared_preferences/shared_preferences.dart';

Future<void> setPersistData(String data) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<String>? items = prefs.getStringList('calculations');
  if (items != null) {
    await prefs.setStringList('calculations', <String>[...items, data]);
  } else {
    await prefs.setStringList('calculations', <String>[data]);
  }
}
