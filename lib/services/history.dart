import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/services/firestore.dart';

Future<void> setPersistData(String equation) async {
  FirestoreService firestoreHistory = FirestoreService();
  await firestoreHistory.addHistory(equation);
}

Future<List> getPersistData() async {
  FirestoreService firestoreHistory = FirestoreService();
  var fetchedData = await firestoreHistory.getHistory();
  // final prefs = await SharedPreferences.getInstance();
  // final List<String>? items = prefs.getStringList('calculations');
  // to show the new enteries on top
  return fetchedData;
}

void clearPersistData() async {
  FirestoreService firestoreHistory = FirestoreService();
  firestoreHistory.deleteHistory();
}
