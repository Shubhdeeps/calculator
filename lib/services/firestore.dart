import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/firebase_options.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference historyRef =
      FirebaseFirestore.instance.collection("history");

  Future<void> addHistory(String data, String userId) {
    return historyRef.add({
      "input": data,
      "created": Timestamp.now(),
      "userId": userId
    }).catchError((onError) => print(onError));
  }

  Future<List<String>> getHistory(String userId) async {
    if (userId == "") {
      return [];
    }
    var historyItems = await historyRef
        .orderBy("created", descending: true)
        .where("userId", isEqualTo: userId)
        .get();
    final List<String> items = [];
    for (final doc in historyItems.docs) {
      var equation = doc["input"] as String;
      var time = doc["created"] as Timestamp;
      var timeString = time.toDate().toString();
      var result = "$equation on $timeString";
      items.add(result);
    }
    return items;
  }

  Future<void> deleteHistory(String userId) async {
    final collection =
        await historyRef.where("userId", isEqualTo: userId).get();
    final batch = FirebaseFirestore.instance.batch();

    for (final doc in collection.docs) {
      batch.delete(doc.reference);
    }

    return batch.commit();
  }
}
