import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChatModel> list = ChatModel.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
        appBar: AppBar(
        elevation: 0,
          backgroundColor: AppColors.mainColor,
          title: Text(
            "Chat",
            style: TextStyle(
              fontSize: 32
            ),
          ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              FlutterIcons.filter
            ), onPressed: null)
      ],
              ),
            )
          ],
        ),
      ),


    );
  }
}
