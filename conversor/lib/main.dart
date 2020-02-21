import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=e65f6855";

void main() async {

  http.Response response = await http.get(request);
  print(json.decode(response.body));
  print(json.decode(response.body)["results"]);
  print(json.decode(response.body)["results"]["currencies"]);
  print(json.decode(response.body)["results"]["currencies"]["USD"]);

  runApp(MaterialApp(
    home: Container()
  ));
}