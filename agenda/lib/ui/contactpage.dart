import 'dart:io';

import 'package:agenda/helpers/contactHelper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;

  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  final _nameController = TextEditingController();
  final _mailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();

  bool _userEdited = false;

  Contact _editedContact;

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());

      _nameController.text = _editedContact.name;
      _mailController.text = _editedContact.mail;
      _phoneController.text = _editedContact.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text(_editedContact.name ?? "New Contact"),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if(_editedContact.name != null && _editedContact.name.isNotEmpty) {
                Navigator.pop(context, _editedContact);
              } else {
                FocusScope.of(context).requestFocus(_nameFocus);
              }
            },
            child: Icon(Icons.save),
            backgroundColor: Colors.red,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: 140.0,
                    height: 140.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: _editedContact.image != null
                                ? FileImage(File(_editedContact.image))
                                : AssetImage("images/person.png"),
                          fit: BoxFit.cover
                        )),
                  ),
                  onTap: () {
                    ImagePicker.pickImage(source: ImageSource.camera).then((file) {
                      if(file == null) return;

                      setState(() {
                        _editedContact.image = file.path;
                      });
                    });
                  },
                ),
                TextField(
                  controller: _nameController,
                  focusNode: _nameFocus,
                  decoration: InputDecoration(labelText: "Name"),
                  onChanged: (text){
                    _userEdited = true;
                    setState(() {
                      _editedContact.name = text;
                    });
                  },
                ),
                TextField(
                  controller: _mailController,
                  decoration: InputDecoration(labelText: "Mail"),
                  onChanged: (text){
                    _userEdited = true;
                    _editedContact.mail = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: "Phone"),
                    onChanged: (text){
                      _userEdited = true;
                      _editedContact.phone = text;
                    }, keyboardType: TextInputType.phone
                )
              ],
            ),
          ))
    );
  }

  Future<bool> _requestPop() {
    if(_userEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Discard changes?"),
              content: Text("Changes will be lost"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                    child: Text("Yes"),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                )
              ],
            );
          }
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
