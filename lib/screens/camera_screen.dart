import 'dart:ui';

import 'package:camera_platform_interface/src/types/camera_description.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameraDescription;

  const CameraScreen(this.cameraDescription, {Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController cameraController;
  late Future<void> _initializeCamera;

  @override
  void initState() {
    super.initState();
    cameraController = CameraController(
      widget.cameraDescription.first,
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.yuv420
    );
    _initializeCamera = cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<void>(
      future: _initializeCamera,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CameraPreview(cameraController);
        } else {
          return  Center(
            child: CircularProgressIndicator(color: Theme.of(context).accentColor,),
          );
        }
      },
    ));
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
  }
}
