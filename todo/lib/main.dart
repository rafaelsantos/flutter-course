import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _todoController = TextEditingController();

  List _todo = [];

  Map<String, dynamic> _last;
  int _lastRemoved;

  @override
  void initState() {
    super.initState();

    _readData().then((data) {
      setState(() {
        _todo = json.decode(data);
      });
    });
  }

  void _addToDo() {
    setState(() {
      //json map
      Map<String, dynamic> newTodo = Map();

      newTodo["title"] = _todoController.text;
      _todoController.text = "";
      newTodo["ok"] = false;

      _todo.add(newTodo);
      _saveData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TODO List"),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                          labelText: "New Task",
                          labelStyle: TextStyle(color: Colors.blueAccent)),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blueAccent,
                    child: Text("Add"),
                    textColor: Colors.white,
                    onPressed: _addToDo,
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 10.0),
                    itemCount: _todo.length,
                    itemBuilder: buildItem))
          ],
        ));
  }

  Widget buildItem(context, index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
          color: Colors.red,
          child: Align(
              alignment: Alignment(-0.9, 0.0),
              child: Icon(Icons.delete, color: Colors.white))),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(_todo[index]["title"]),
        value: _todo[index]["ok"],
        secondary: CircleAvatar(
            child: Icon(_todo[index]["ok"] ? Icons.check : Icons.error)),
        onChanged: (c) {
          setState(() {
            _todo[index]["ok"] = c;
            _saveData();
          });
        },
      ),
      onDismissed: (direction){
        setState(() {
          _last = Map.from(_todo[index]);
          _lastRemoved = index;
          _todo.removeAt(index);

          _saveData();
        });
      },
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_todo);
    final file = await _getFile();

    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
