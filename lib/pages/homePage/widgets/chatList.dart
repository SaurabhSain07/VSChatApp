import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/pages/homePage/widgets/chatTile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: (){
            Get.toNamed("/chatPage");
          },
          child: ChatTile(
            imageUrl: AssetsImage.girl,
            name: "Nandni Sain",
            lastChat: "Abhi me School jaa rhi hu",
            lastTime: "07:30 am",
          ),
        ),
        
        ChatTile(
          imageUrl: AssetsImage.boy,
          name: "Saurabh Sain",
          lastChat: "Nandni Kha jaa rhi ho",
          lastTime: "07:30 am",
        ),
       
      ],
    );
  }
}
