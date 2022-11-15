import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/home_screen.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zego Live Streaming',
      home: HomeScreen(),
    );
  }
}



