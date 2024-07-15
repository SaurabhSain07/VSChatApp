import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vschatapp/Controller/GroupController.dart';
import 'package:vschatapp/Controller/chatController.dart';
import 'package:vschatapp/Controller/imagePickerController.dart';
import 'package:vschatapp/Model/GroupModel.dart';
import 'package:vschatapp/Model/userModel.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/widgets/imagePickerBottemSheet.dart';

class GroupMessageType extends StatelessWidget {
  final GroupModel groupModel;
  const GroupMessageType({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController=Get.put(ChatController());
    TextEditingController messageController=TextEditingController();
    ImagePickerController imagePickerController=Get.put(ImagePickerController());
    GroupController groupController= Get.put(GroupController());
    RxString message="".obs;
    return Container(
          margin:const EdgeInsets.all(10),
          padding:const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(100)),
          child: Row(
            children: [
              InkWell(
                onTap: (){},
                child: const Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.white38,
                )),
             const SizedBox(width: 10,),
              Expanded(
                child: TextField(
                  onChanged: (value){
                    message.value=value;
                  },
                  controller: messageController,
                  decoration:const InputDecoration(
                    hintText: "Type message...",
                    filled: false),
                )
                ),
              const SizedBox(width: 10,),
              Obx(() => chatController.selectImagePath.value==""
              ?InkWell(
                onTap: () {
                  imagePickerBottemSheet(context, chatController, imagePickerController);
                },
                child: SvgPicture.asset(AssetsImage.gallerySVG))
                :InkWell(
                  onTap: (){
                    chatController.selectImagePath.value="";
                  },
                  child:const SizedBox(),
                ),),
              const SizedBox(width: 10,),
              Obx(() => message.value !="" || chatController.selectImagePath.value!=""
              ? InkWell(
                onTap: () {
                  groupController.sendGroupMessage(messageController.text, groupModel.id!, "");
                  messageController.clear();
                  message.value="";
                },
                child: chatController.isLoading.value 
                ?const CircularProgressIndicator()
                :SvgPicture.asset(AssetsImage.sendSVG)
              )  
              : InkWell(
                onTap: (){},
                child: SvgPicture.asset(AssetsImage.micSVG))
              
             )
            ],
          )
         );
  }

  
}