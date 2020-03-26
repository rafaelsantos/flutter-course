import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

  Firestore.instance.collection("messages").document().setData({
    "text": "Hello",
    "from": "Rafael Santos",
    "read": false
  });

  Firestore.instance.collection("messages").document("jTDYuTakiZ7L2P4ZzwZ6").updateData({
    "read": false
  });

  Firestore.instance.collection("messages")
      .document("jTDYuTakiZ7L2P4ZzwZ6")
      .collection("files").document()
      .setData({
        "read": false
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
