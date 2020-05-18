import 'dart:io';

import 'package:chat/textcomposer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  void _sendMessage(String text) {
    Firestore.instance.collection('messages').add({
      'text': text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        elevation: 0,
      ),
      body: TextComposer(_sendMessage),
    );
  }
}
