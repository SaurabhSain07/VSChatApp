import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vschatapp/Controller/chatController.dart';
import 'package:vschatapp/Controller/contactController.dart';
import 'package:vschatapp/Controller/profileController.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/pages/Chats/chatPage.dart';
import 'package:vschatapp/pages/ContactPage/Widgets/contatSearch.dart';
import 'package:vschatapp/pages/ContactPage/Widgets/newContactTile.dart';
import 'package:vschatapp/pages/homePage/widgets/chatTile.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
    ContactController contactController=Get.put(ContactController());
    ProfileController profileController=Get.put(ProfileController());
    ChatController chatController=Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Select contact"),
        actions: [
          Obx(() => IconButton(onPressed: () {
            isSearchEnable.value= !isSearchEnable.value;
          },
           icon:isSearchEnable.value
           ?Icon(Icons.close) 
           :Icon(Icons.search)
           ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
         child: ListView(
         children: [
         const SizedBox(height: 10,),
         Obx(() => isSearchEnable.value? ContactSearch(): SizedBox()),
         const SizedBox(height: 10,),
          NewContactTile(
              icon: Icons.person_add,
              btnName: 'New contact',
              ontap: () {},
            ),
          const SizedBox(height: 10,),  
          NewContactTile(
              icon: Icons.person_add,
              btnName: 'New Group',
              ontap: () {},
            ),
         const SizedBox(height: 10),
          const Row(
              children: [
                Text("Contacts on Sampark"),
              ],
            ),
          SizedBox(height: 10,),
          Obx(() => Column(
            children: contactController.userList.map(
              (e) => InkWell(
                onTap: () {
                  Get.to(ChatPage(userModel: e));
                },
                child: ChatTile(
                  imageUrl: e.profileImage?? AssetsImage.defaultProfileImage,
                  name: e.name ?? "User",
                  lastChat: e.about?? "Hay there", 
                  lastTime: e.email! ==
                                        profileController
                                            .currentUser.value.email
                                    ? "You"
                                    : ""
                  ),
              )).toList()
            ,
          ))
         ],
        ),
      ),
    );
  }
}