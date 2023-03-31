
import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'dart:math' as math;

/// Note that the userID needs to be globally unique,
final String localUserID = math.Random().nextInt(10000).toString();

class GroupCallPage extends StatelessWidget {
  /// Users who use the same callID can in the same call.
  final callIDTextCtrl = TextEditingController(text: "group_call_id");

  GroupCallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: callIDTextCtrl,
                  decoration: const InputDecoration(
                      labelText: "join a group call by id"),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return CallPage(callID: callIDTextCtrl.text);
                      }),
                    );
                  },
                  child: const Text("join"))
            ],
          ),
        ),
      ),
    );
  }
}

class CallPage extends StatelessWidget {
  final String callID;

  const CallPage({
    Key? key,
    required this.callID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: Utils.appId /*input your AppID*/,
        appSign: Utils.appSignin /*input your AppSign*/,
        userID: localUserID,
        userName: "user_$localUserID",
        callID: callID,
        config: ZegoUIKitPrebuiltCallConfig.groupVideoCall(),
      ),
    );
  }
}