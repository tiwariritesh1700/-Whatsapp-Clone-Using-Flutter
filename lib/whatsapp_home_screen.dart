import 'package:camera_platform_interface/src/types/camera_description.dart';
import 'package:flutter/material.dart';
import 'package:whtsapp_clone/screens/call_screen.dart';
import 'package:whtsapp_clone/screens/camera_screen.dart';
import 'package:whtsapp_clone/screens/chat_screen.dart';
import 'package:whtsapp_clone/screens/status_screen.dart';
import 'package:camera/camera.dart';

class WhatsAppHomeScreen extends StatefulWidget {
  List<CameraDescription> cameraDescription;

  WhatsAppHomeScreen(this.cameraDescription);

  @override
  _WhatsAppHomeScreenState createState() => _WhatsAppHomeScreenState();
}

class _WhatsAppHomeScreenState extends State<WhatsAppHomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  bool showFab = true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    tabController.addListener(() {
      if(tabController.index ==1){
        showFab = true;
      }else{
        showFab= false;
      }
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whatsapp'),
        elevation: 0.7,
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
          ),
          Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ],
        bottom: TabBar(
          onTap: (value) async {
            print("tab Clicked " + value.toString());
          },
          controller: tabController,
          indicatorColor: Colors.white,
          tabs: [
            getCameraTab(),
            getChatTab(),
            getStatusTab(),
            getCallTab(),
          ],
        ),
      ),
      body: TabBarView(controller: tabController, children: [
        CameraScreen(widget.cameraDescription),
        ChatScreen(),
        StatusScreen(),
        CallScreen(),
      ]),
      floatingActionButton: showFab
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).accentColor,
              onPressed: () {},
              child: Icon(
                Icons.chat,
                color: Colors.white,
              ),
            )
          : null,
    );
  }

  Tab getCallTab() {
    return Tab(
      child: Text(
        'CALLS',
      ),
    );
  }

  Tab getStatusTab() {
    return Tab(
      child: Text(
        'STATUS',
      ),
    );
  }

  Tab getChatTab() {
    return Tab(
      child: Text(
        'CHATS',
      ),
    );
  }

  Tab getCameraTab() {
    return Tab(
      icon: Icon(
        Icons.camera,
      ),
    );
  }
}
