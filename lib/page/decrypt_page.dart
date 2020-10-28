import 'dart:async';

import 'package:encrypted_message_app/services/encrypt_service.dart';
import 'package:flutter/material.dart';

class DecryptPage extends StatefulWidget {
  const DecryptPage({Key key}) : super(key: key);

  @override
  _DecryptPageState createState() => _DecryptPageState();
}

class _DecryptPageState extends State<DecryptPage> {
  final textController = TextEditingController();
  final keyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.text,
                controller: textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Encrypted Text",
                  labelText: "Encrypted Text",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: keyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Key",
                  labelText: "Key",
                ),
              ),
              RaisedButton(
                onPressed: () async {
                  if (textController.text != null &&
                      keyController.text != null) {
                    var result = await EncrytService().getDecryptedText(
                        textController.text, keyController.text);

                    Timer(Duration(seconds: 2), () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Decrypted Text"),
                              content: Text(
                                result,
                                style: TextStyle(fontSize: 25),
                              ),
                            );
                          });
                    });
                  }
                },
                child: Text("Decrypt"),
              )
            ],
          ),
        ));
  }
}
