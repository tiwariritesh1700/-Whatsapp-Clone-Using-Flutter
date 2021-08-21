import 'package:flutter/material.dart';
import 'package:whtsapp_clone/whatsapp_home_screen.dart';
import 'package:camera/camera.dart';
late List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();

   cameras = await availableCameras();
  //final firstCamera = cameras.first;
  runApp(WhatsAppClone(),);
}

class WhatsAppClone extends StatefulWidget {

  WhatsAppClone();
  @override
  _WhatsAppCloneState createState() => _WhatsAppCloneState();
}

class _WhatsAppCloneState extends State<WhatsAppClone> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
          accentColor: Color(0xff25D366), primaryColor: Color(0xff075e54)),
      debugShowCheckedModeBanner: false,
      home: Container(child: WhatsAppHomeScreen(cameras)),
    );
  }
}
