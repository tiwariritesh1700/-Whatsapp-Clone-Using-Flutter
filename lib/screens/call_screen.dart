import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Calls'
              ,style: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
    );
  }
}
