import 'dart:async';

import 'package:encrypted_message_app/services/encrypt_service.dart';
import 'package:flutter/material.dart';

class DecryptPage extends StatefulWidget {
  const DecryptPage({Key key}) : super(key: key);

  @override
  _DecryptPageState createState() => _DecryptPageState();
}

class _DecryptPageState extends State<DecryptPage> {
  final senderPhoneController = TextEditingController();
  final recieverPhoneController = TextEditingController();
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: senderPhoneController,
                  decoration: InputDecoration(
                    hintText: "Enter Sender's Phone number",
                    labelText: "Sender's Phone",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: recieverPhoneController,
                  decoration: InputDecoration(
                    hintText: "Enter your Phone number",
                    labelText: " Your Phone",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Encrypted Text",
                    labelText: "Encrypted Text",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () async {
                  if (textController.text != null &&
                      recieverPhoneController.text != null &&
                      senderPhoneController.text != null) {
                    String key = senderPhoneController.text.trim() +
                        recieverPhoneController.text.trim() +
                        "abcdefghijkl";
                    var result = await EncrytService()
                        .getDecryptedText(textController.text, key);

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
