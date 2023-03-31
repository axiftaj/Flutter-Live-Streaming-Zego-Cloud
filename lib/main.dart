import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/audio_calling_screen.dart';
import 'package:flutter_live_streaming_app/group_calling_screen.dart';
import 'package:flutter_live_streaming_app/video_calling.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zego Video Calling',
      home:  GroupCallPage(),
    );
  }
}



