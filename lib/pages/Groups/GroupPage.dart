import 'package:flutter/material.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/pages/homePage/widgets/chatTile.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(
            imageUrl: AssetsImage.defaultProfileImage,
            name: "Study Group",
            lastChat: "Last Chat",
            lastTime: "Last Time")
      ],
    );
  }
}