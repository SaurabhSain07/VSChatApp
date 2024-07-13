import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vschatapp/Controller/GroupController.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/pages/homePage/widgets/chatTile.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController=Get.put(GroupController());
    return Obx(() => ListView(
      children: groupController.groupList
          .map((group) => InkWell(
          onTap: (){},
          child: ChatTile(
              name: group.name!,
              imageUrl: group.profileUrl == ""
                        ? AssetsImage.defaultProfileImage
                        : group.profileUrl!,
              lastChat: "Last Chat",
              lastTime: "just Now"),
          )
        ).toList(),
    ));
  }
}