import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'dart:math' as math;


class AudioCallingScreen extends StatefulWidget {
  const AudioCallingScreen({Key? key}) : super(key: key);

  @override
  State<AudioCallingScreen> createState() => _AudioCallingScreenState();
}


final userId = math.Random().nextInt(10000).toString();


class _AudioCallingScreenState extends State<AudioCallingScreen> {

  final callIdController = TextEditingController(text: '1');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Calling'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: callIdController,
              decoration: InputDecoration(
                hintText: 'Enter callign id' ,
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            TextButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AudioCallingPage(callingId: callIdController.text.toString()))) ;
            }, child: Text('Call'))
          ],
        ),
      ),
    );
  }
}


class AudioCallingPage extends StatelessWidget {
  final String callingId ;
  const AudioCallingPage({Key? key, required this.callingId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ZegoUIKitPrebuiltCall(
          appID: Utils.appId ,
          appSign: Utils.appSignin,
          userID: userId,
          callID: callingId,
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()
          ..onOnlySelfInRoom = (context){
            Navigator.pop(context);
          },
          userName: 'Asif Taj',
        )
    );
  }
}
