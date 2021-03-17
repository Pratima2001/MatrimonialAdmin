import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  String id, url;

  MessageScreen1 createState() => MessageScreen1();
  MessageScreen({this.id, this.url});
}

class MessageScreen1 extends State<MessageScreen> {
  bool istyping = false;

  TextEditingController c = TextEditingController();

  sendmessage(String message) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.url),
            )),
        title: Text(
          widget.id,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 15, bottom: 50, left: 15),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(bottom: 15, top: 15),
                  height: 45,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            controller: c,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: "Type a message",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                          ),
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            sendmessage(c.text);
                          })
                    ],
                  )))
        ],
      ),
    );
  }
}
