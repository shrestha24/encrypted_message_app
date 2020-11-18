import 'package:encrypted_message_app/page/encrypt_page.dart';
import 'package:encrypted_message_app/page/home.dart';
import 'package:encrypted_message_app/page/homeScreen.dart';
import 'package:encrypted_message_app/page/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App',
        home: Home());
  }
}
