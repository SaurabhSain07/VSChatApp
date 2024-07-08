import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vschatapp/Controller/contactController.dart';
import 'package:vschatapp/Controller/profileController.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/pages/Chats/chatPage.dart';
import 'package:vschatapp/pages/homePage/widgets/chatTile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController =Get.put(ContactController());
    ProfileController profileController =Get.put(ProfileController());
    return RefreshIndicator(child: Obx(() => ListView(
      children: contactController.chatRoomList.map((e) => InkWell(
          onTap: (){
           Get.to(
            ChatPage(
             userModel: (e.receiver!.id ==
                     profileController.currentUser.value.id
                 ? e.sender
                 : e.receiver)!,));
          },
          child: ChatTile(
            imageUrl: (e.receiver!.id ==
                                  profileController.currentUser.value.id
                              ? e.sender!.profileImage
                              : e.receiver!.profileImage) ??
                          AssetsImage.defaultProfileImage,
            name:(e.receiver!.id ==
                                  profileController.currentUser.value.id
                              ? e.sender!.name
                              : e.receiver!.name)!,
            lastChat:e.lastMessage?? "Last message",
            lastTime:e.lastMessageTimestamp?? "Last Time",
          ),
        ),).toList()
     )
    ), onRefresh: (){
      return contactController.getChatRoomList();
    });
    
  }
}
