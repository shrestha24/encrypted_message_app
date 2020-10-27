import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {},
            child: Text("Encrypt"),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("Decrypt"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String sms = "Hello";
          var uri = 'sms:+91 6371849902?body=' + sms;
          launch(uri);
        },
        child: Icon(Icons.sms),
      ),
    );
  }

  /* void _sendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }*/
}
