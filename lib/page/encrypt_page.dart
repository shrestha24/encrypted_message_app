import 'package:flutter/material.dart';
import 'package:encrypted_message_app/services/encrypt_service.dart';

class EncryptForm extends StatelessWidget {
  final msgController = TextEditingController();
  final keyControler = TextEditingController();
  EncryptForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ENCRYPT FORM"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            RaisedButton(
              onPressed: () async {
                String key1 = 'my 32 length key................';
                var result = await EncrytService()
                    .getEncryptedText(msgController.text, keyControler.text);
                print(
                    ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

                print(result);
                print(
                    "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
