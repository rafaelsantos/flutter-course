import 'package:sqflite/sqflite.dart';

final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String phoneColumn = "phoneColumn";
final String imageColumn = "imageColumn";
final String mailColumn = "mailColumn";

class ContactHelper {

}

class Contact {
  int id;

  String name;
  String mail;
  String phone;
  String image;

  Contact.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    mail = map[mailColumn];
    phone = map[phoneColumn];
    image = map[imageColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      mailColumn: mail,
      phoneColumn: phone,
      imageColumn: image
    };

    if(id != null) {
      map[idColumn] = id;
    }

    return map;
  }

  @override
  String toString() {
    return "Contact(id: $i, name: $name, mail: $mail, phone: $phone, image: $image)";
  }


}