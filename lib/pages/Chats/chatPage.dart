import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vschatapp/Controller/chatController.dart';
import 'package:vschatapp/Controller/profileController.dart';
import 'package:vschatapp/Model/userModel.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/pages/Chats/Widgets/ChatBubble.dart';
import 'package:vschatapp/pages/UserProfile/Profile.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  const ChatPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController=Get.put(ChatController());
    ProfileController profileController=Get.put(ProfileController());
    TextEditingController messageController=TextEditingController();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
              Get.to(UserProfilePage(
                userModel: userModel,
              ));
            },
            child: Image.asset(AssetsImage.girl)),
          ),
          title: InkWell(
            onTap: () {
              Get.to(UserProfilePage(
                userModel: userModel,
              ));
            },
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userModel.name ?? "User",
                     style: Theme.of(context).textTheme.bodyLarge,),
                     Text("Online", 
                     style: Theme.of(context).textTheme.labelMedium, selectionColor: Colors.white,),  
                  ],
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call_sharp),
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.videocam_outlined))
          ],
        ),
        
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin:const EdgeInsets.all(10),
          padding:const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(100)),
          child: Row(
            children: [
              SvgPicture.asset(AssetsImage.micSVG),
             const SizedBox(width: 10,),
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration:const InputDecoration(
                    hintText: "Type message...",
                    filled: false),
                )
                ),
              const SizedBox(width: 10,),
              SvgPicture.asset(AssetsImage.gallerySVG),
              const SizedBox(width: 10,),
              InkWell(
                onTap: () {
                  if (messageController.text.isNotEmpty) {
                    chatController.sendMessage(
                            userModel.id!, messageController.text, userModel);
                    messageController.clear();
                  }
                },
                child: SvgPicture.asset(AssetsImage.sendSVG)
              ),  
            ],
          )
         ),
        
        body: Padding(
          padding: EdgeInsets.only(bottom: 90, top: 10, left: 10, right: 10),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    StreamBuilder(
                    stream: chatController.getMessage(userModel.id!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error}"),
                        );
                      }
                      if (snapshot.data == null) {
                        return const Center(
                          child: Text("No Messages"),
                        );
                      } else {
                        return ListView.builder(
                          reverse: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            DateTime timestamp = DateTime.parse(
                                snapshot.data![index].timestamp!);
                            String formattedTime =
                                DateFormat('hh:mm a').format(timestamp);
                            return ChatBubble(
                              message: snapshot.data![index].message!,
                              imageUrl: snapshot.data![index].imageUrl ?? "",
                              isComming: snapshot.data![index].receiverId ==
                                  profileController.currentUser.value.id,
                              status: "read",
                              time: formattedTime,
                            );
                          },
                        );
                      }
                    },
                  ),
                  
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
