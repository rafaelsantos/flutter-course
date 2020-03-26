import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());

  QuerySnapshot snapshot = await Firestore.instance.collection("messages").getDocuments();

  snapshot.documents.forEach((d){
    d.reference.updateData({"read": false});

    print(d.data);
    print(d.documentID);
  });

  DocumentSnapshot dSnapshot = await Firestore.instance.collection("messages")
    .document("a7MtgeStq3vcttk2PUC8").get();

  print(dSnapshot.data);

  Firestore.instance.collection("messages").snapshots().listen((data){
    data.documents.forEach((value){
      print(value.data);
    });
  });
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
