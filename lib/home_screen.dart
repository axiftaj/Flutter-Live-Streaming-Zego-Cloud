

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/live_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Generate Live Streaming ID with 6 digit length
  final liveIDController = TextEditingController(
    text: '1111',
  );

  // Generate userID with 6 digit length
  final String userID = Random().nextInt(900000 + 100000).toString();


  @override
  Widget build(BuildContext context) {
    var buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff034ada),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text('Your UserID: $userID'),
            const Text('Please test with two or more devices'),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: liveIDController,
              decoration: const InputDecoration(
                labelText: 'Join or Start a Live by Input an ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: buttonStyle,
              child: const Text('Start a Live'),
              onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LiveScreenView(
                      liveID: liveIDController.text,
                      isHost: true, userID: '',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                style: buttonStyle,
                child: const Text('Join a Live'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LiveScreenView(
                        liveID: liveIDController.text,
                        isHost: false,
                        userID: '',
                      ),
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }

}