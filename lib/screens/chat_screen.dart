import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whtsapp_clone/model/chat_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              new Divider(
                height: 10.0,
                thickness: 1,
              ),
              ListTile(
                leading: CircleAvatar(
                  foregroundColor: Theme.of(context).accentColor,
                  backgroundImage: NetworkImage(dummyData[index].avatarUrl),
                  backgroundColor: Colors.grey,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dummyData[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dummyData[index].time,
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    )
                  ],
                ),
                subtitle: Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    dummyData[index].message,
                    style: TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
