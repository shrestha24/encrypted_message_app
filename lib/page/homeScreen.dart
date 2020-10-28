import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChatModel> list = ChatModel.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.mainColor,
        appBar: AppBar(
        elevation: 0,
          backgroundColor: Colors.mainColor,
          title: Text(
            "Chat",
            style: TextStyle(
              fontSize: 32
            ),
          ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              FontAwesomeIcons.filter,
              color: Colors.blue,
            ),
            onPressed: null),

      ],
              ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              )
            ),
         child: TextField(
           decoration: InputDecoration(
             prefixIcon: Icon(
               FontAwesomeIcons.search,
               color: Colors.white54,
             ),
             hintText: "Search",
             hintStyle: TextStyle(
               color: Colors.white54,
             ),
           ),
         ),
          ),
          Expanded(
            child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ChatItemPage(),
                  ),
                );
              },
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                  image: DecorationImage(
                      image: ExactAssetImage(""),
                  ),
                ),
              ),
              title: Text(
                list[index].contact.name,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: list[index].isTyping
              ? Row(
                children: <Widget>[
                  SpinKitThreeBounce(
                    color: Colors.blue,
                    size:20.0,
                  ),
                ],
              )
             : Row(
                children: <Widget>[
                  Text(
                    list[index].lastMessage,
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                  SizedBox(width: 25),
                  Text(
                    list[index].lastMesasgeTime + "days ago",
                    style: TextStyle(
                      color: Colors.white54
                    ),
                  )
                ],
              )
            )
          }
            ),
          )
        ],
      ),
            )
          ],
        ),
      ),


    );
  }
}
