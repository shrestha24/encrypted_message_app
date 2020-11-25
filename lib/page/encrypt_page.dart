import 'dart:async';

import 'package:encrypted_message_app/page/decrypt_page.dart';
import 'package:flutter/material.dart';
import 'package:encrypted_message_app/services/encrypt_service.dart';
import 'package:url_launcher/url_launcher.dart';

class EncryptForm extends StatelessWidget {
  final msgController = TextEditingController();
  final senderPhoneController = TextEditingController();
  final recieverPhoneController = TextEditingController();
  final keyControler = TextEditingController();
  final encryptedText = TextEditingController();
  EncryptForm({Key key}) : super(key: key);
  String text = "Encrypted Text Will Appear here";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ENCRYPT FORM"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: senderPhoneController,
                  decoration: InputDecoration(
                    hintText: "Enter Sender Phone",
                    labelText: "Sender Phone",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: recieverPhoneController,
                  decoration: InputDecoration(
                    hintText: "Enter Reciever Phone",
                    labelText: " Reciever Phone",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: msgController,
                  decoration: InputDecoration(
                    hintText: "Enter String",
                    labelText: "Message",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0)
                    ),
                    onPressed: () async {
                      String key = senderPhoneController.text.trim() +
                          recieverPhoneController.text.trim() +
                          "abcdefghijkl";
                      var result = await EncrytService()
                          .getEncryptedText(msgController.text, key);

                      print(result);
                      encryptedText.text = result;

                      Timer(Duration(seconds: 2), () {
                        var uri = 'sms:' +
                            recieverPhoneController.text +
                            '?body=' +
                            result;
                        launch(uri);
                      });
                    },
                    child: Text("Send Encrypted Text"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
