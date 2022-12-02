import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// the security rules at firebase has been update, only the person with uid can read his/her docs.
class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference historyRef =
      FirebaseFirestore.instance.collection("history");

  Future<void> addHistory(String data) {
    // print(auth.currentUser!.uid);
    return historyRef.add({
      "input": data,
      "created": Timestamp.now(),
      "userId": auth.currentUser!.uid
    }).catchError((onError) => print(onError));
  }

  Future<List<String>> getHistory() async {
    var historyItems = await historyRef
        .orderBy("created", descending: true)
        .where("userId", isEqualTo: auth.currentUser!.uid)
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

  Future<void> deleteHistory() async {
    final collection = await historyRef
        .where("userId", isEqualTo: auth.currentUser!.uid)
        .get();
    final batch = FirebaseFirestore.instance.batch();

    for (final doc in collection.docs) {
      batch.delete(doc.reference);
    }

    return batch.commit();
  }
}
