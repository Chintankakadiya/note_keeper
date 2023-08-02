import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCloudHelper {
  FirebaseCloudHelper._();

  static final FirebaseCloudHelper firebaseCloudHelper =
      FirebaseCloudHelper._();
  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  CollectionReference note = firebaseFirestore.collection('notes');
  CollectionReference counter = firebaseFirestore.collection('counter');

  insertData({required String title, required String desc}) async {
    QuerySnapshot querySnapshot = await counter.get();
    List<QueryDocumentSnapshot> queryDcoumentSnapshot = querySnapshot.docs;
    Map<String, dynamic> noteCounter =
        queryDcoumentSnapshot.last.data() as Map<String, dynamic>;

    int id = noteCounter["id"];
    log(id.toString(), name: "Helper ID");
    await note.doc().set({'title': title, 'desc': desc});
    id++;
    counter.doc('note_counter').update({'id': id});
  }

  Stream<QuerySnapshot> fetchAllData() {
    Stream<QuerySnapshot> stream = note.snapshots();
    return stream;
  }

  Future<void> updateData(
      {required String id, required String title, required String desc}) async {
    await note.doc(id).update({'title': title, "desc": desc});
  }

  Future<void> deleteData({required String deleteId}) async {
    QuerySnapshot querySnapshot = await counter.get();
    List<QueryDocumentSnapshot> queryDocumentSnapshot = querySnapshot.docs;
    Map<String, dynamic> noteCounter =
        queryDocumentSnapshot.last.data() as Map<String, dynamic>;
    int id = noteCounter['id'];
    id--;
    counter.doc('note_counter').update({'id': id});
    await note.doc(deleteId).delete();
  }
}
