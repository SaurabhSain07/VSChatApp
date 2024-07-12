import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:vschatapp/Controller/GroupController.dart';
import 'package:vschatapp/Controller/imagePickerController.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/pages/homePage/widgets/chatTile.dart';

class GroupTitle extends StatelessWidget {
  const GroupTitle({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController=Get.put(GroupController());
    ImagePickerController imagePickerController=Get.put(ImagePickerController());
    RxString imagePath="".obs;
    TextEditingController groupName=TextEditingController();
    
    return Scaffold(
      appBar: AppBar(title:const Text("New Group")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          groupController.createGroup(groupName.toString(), imagePath.value);
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: groupController.isLoading.value
            ? CircularProgressIndicator()
            : Icon(
                Icons.done,
                color: Colors.white,
              ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Container(
            padding:const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Obx(() => InkWell(
                        onTap: ()async{
                          imagePath.value = await imagePickerController
                              .pickImage(ImageSource.gallery);   
                        },
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).colorScheme.primary
                          ),
                          child: imagePath.value == ""
                              ?const Icon(Icons.group, size: 40,)
                              : ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.file(
                                      File(imagePath.value),
                                      fit: BoxFit.cover,
                                    )),
                        ),
                      ),),
                     
                     const SizedBox(height: 20,),
                     TextFormField(
                      controller: groupName,
                      decoration:const InputDecoration(
                        hintText: "Group Name",
                        prefixIcon: Icon(Icons.group)
                      ),
                     )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: groupController.groupMembers
                    .map((e) => ChatTile(
                        imageUrl: e.profileImage ?? AssetsImage.defaultProfileImage,
                        name: e.name!,
                        lastChat: e.about ?? "",
                        lastTime: ""))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}