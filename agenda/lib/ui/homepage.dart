import 'package:agenda/helpers/contactHelper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ContactHelper helper = ContactHelper();

  @override
  void initState() {
    super.initState();

    Contact contact = Contact();
    contact.name = "Rafael Santos";
    contact.mail = "test@mail.com";
    contact.phone = "343434343433";
    contact.image = "image";

    helper.saveContact(contact);

    helper.getAllContacts().then((list) {
      print(list);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
