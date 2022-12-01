import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/firebase_options.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference historyRef =
      FirebaseFirestore.instance.collection("history");

  Future<void> addHistory(String data) {
    return historyRef
        .add({"input": data, "created": Timestamp.now()})
        .then((value) => print("history added"))
        .catchError((onError) => print(onError));
  }

  Future<List<String>> getHistory() async {
    var historyItems =
        await historyRef.orderBy("created", descending: true).get();
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

  Future<void> deleteHistory() async {
    final collection = await historyRef.get();
    final batch = FirebaseFirestore.instance.batch();

    for (final doc in collection.docs) {
      batch.delete(doc.reference);
    }

    return batch.commit();
  }
}
