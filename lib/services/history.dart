import 'dart:ffi';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/services/firestore.dart';
import 'package:uuid/uuid.dart';

//  used uuid to restrict user to only attain his data
// firebase auth with firebase security rules would required additional UI for login/regestration, hence uuid is used.
Future<void> setPersistData(String equation) async {
  String userId;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? user = prefs.getString('currentUser');
  if (user != null) {
    userId = user;
  } else {
    final String uuid = const Uuid().v1();
    await prefs.setString("currentUser", uuid);
    userId = uuid;
  }
  FirestoreService firestoreHistory = FirestoreService();
  await firestoreHistory.addHistory(equation, userId);
}

Future<List> getPersistData() async {
  final prefs = await SharedPreferences.getInstance();
  final String? user = prefs.getString('currentUser');
  FirestoreService firestoreHistory = FirestoreService();
  var fetchedData = await firestoreHistory.getHistory(user ?? "");

  return fetchedData;
}

void clearPersistData() async {
  final prefs = await SharedPreferences.getInstance();
  final String? user = prefs.getString('currentUser');
  FirestoreService firestoreHistory = FirestoreService();
  firestoreHistory.deleteHistory(user ?? "");
}
