import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vschatapp/Controller/contactController.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/pages/homePage/widgets/chatTile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController =Get.put(ContactController());
    return Obx(() => ListView(
      children: contactController.chatRoomList.map((e) => InkWell(
          onTap: (){
            Get.toNamed("/chatPage");
          },
          child: ChatTile(
            imageUrl: AssetsImage.defaultProfileImage,
            name: "Nandni Sain",
            lastChat: "Abhi me School jaa rhi hu",
            lastTime: "07:30 am",
          ),
        ),).toList()
     )
    );
    
  }
}
