import 'package:untitled/services/firestore.dart';

Future<void> setPersistData(String equation) async {
  FirestoreService firestoreHistory = FirestoreService();
  await firestoreHistory.addHistory(equation);
}

Future<List> getPersistData() async {
  FirestoreService firestoreHistory = FirestoreService();
  var fetchedData = await firestoreHistory.getHistory();

  return fetchedData;
}

void clearPersistData() async {
  FirestoreService firestoreHistory = FirestoreService();
  firestoreHistory.deleteHistory();
}
