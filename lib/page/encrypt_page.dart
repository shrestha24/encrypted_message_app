import 'dart:async';

import 'package:flutter/material.dart';
import 'package:encrypted_message_app/services/encrypt_service.dart';
import 'package:url_launcher/url_launcher.dart';

class EncryptForm extends StatelessWidget {
  final msgController = TextEditingController();
  final phoneController = TextEditingController();
  final keyControler = TextEditingController();
  final encryptedText = TextEditingController();
  EncryptForm({Key key}) : super(key: key);
  String text = "Encrypted Text Will Appera here";

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
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: "Enter Phone",
                    labelText: "Phone",
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: keyControler,
                  decoration: InputDecoration(
                    hintText: "Enter key",
                    labelText: "key",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () async {
                      var uri = 'sms:' +
                          phoneController.text +
                          '?body=' +
                          keyControler.text;
                      launch(uri);

                      /* var result1 = await EncrytService()
                      .getDecryptedText(result, keyControler.text);*/
                    },
                    child: Text("Send Key"),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      var result = await EncrytService().getEncryptedText(
                          msgController.text, keyControler.text);

                      print(result);
                      encryptedText.text = result;

                      Timer(Duration(seconds: 2), () {
                        var uri =
                            'sms:' + phoneController.text + '?body=' + result;
                        launch(uri);
                      });
                    },
                    child: Text("Send Encrypted Text"),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: encryptedText,
                  decoration: InputDecoration(
                    hintText: "Encrypted Text",
                    labelText: "Encrypted Text Will Appear Here",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
