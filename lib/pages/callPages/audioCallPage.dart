import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vschatapp/Controller/chatController.dart';
import 'package:vschatapp/Controller/profileController.dart';
import 'package:vschatapp/Model/userModel.dart';
import 'package:vschatapp/configur/string.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class AudioCallPage extends StatelessWidget {
  final UserModel target;
  const AudioCallPage({super.key, required this.target});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController=Get.put(ProfileController());
    ChatController chatController =Get.put(ChatController());
    var callId=chatController.getRoomId(target.id!);
    return ZegoUIKitPrebuiltCall(
    appID: ZegoCloudConfig.appId,
    appSign: ZegoCloudConfig.appSing,
    userID: profileController.currentUser.value.id ?? "root",
    userName: profileController.currentUser.value.name ?? "root",
    callID: callId,
    config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
  );
 }
}