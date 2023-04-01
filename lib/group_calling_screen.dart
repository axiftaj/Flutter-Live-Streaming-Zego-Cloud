
import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import 'dart:math' as math;

final String userId = math.Random().nextInt(10000).toString() ;

class GroupCallScreen extends StatelessWidget {
  GroupCallScreen({Key? key}) : super(key: key);

  final callingId = TextEditingController(text: 'group_call_id');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                    controller: callingId,
                    decoration: InputDecoration(
                      labelText: 'Join group call by id'
                    ),
                  )
              ),
              ElevatedButton(onPressed: (){
               Navigator.push(context,
                   MaterialPageRoute(
                       builder: (context){
                         return CallPage(callingId: callingId.text.toString());
                       }
                   )
               );
              },
                  child: Text('Join')
              )
            ],
          ),
        ),
      ),
    );
  }
}


class CallPage extends StatelessWidget {
  final String callingId ;
  const CallPage({Key? key , required this.callingId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: ZegoUIKitPrebuiltCall(
          appID: Utils.appId,
          appSign: Utils.appSignin,
          userID: userId ,
          userName: 'username_$userId' ,
          callID: callingId ,
          config: ZegoUIKitPrebuiltCallConfig.groupVideoCall(),
        )
    );
  }
}


