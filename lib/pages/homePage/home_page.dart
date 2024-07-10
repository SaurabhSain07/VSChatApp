import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vschatapp/Controller/contactController.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/configur/string.dart';
import 'package:vschatapp/pages/Groups/GroupPage.dart';
import 'package:vschatapp/pages/homePage/widgets/chatList.dart';
import 'package:vschatapp/pages/homePage/widgets/myTapBar.dart';

import '../../Controller/profileController.dart';
import '../Profile/profilePage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    ProfileController profileController=Get.put(ProfileController());
    ContactController contactController =Get.put(ContactController());
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            AssetsImage.appIconSVG,
          ),
        ),
        title: Text(
          AppString.appName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(onPressed: () {
           contactController.getChatRoomList();
          }, icon: Icon(Icons.search)),
          IconButton(onPressed: () {
            Get.to(ProfilePage());
          }, 
          icon: Icon(Icons.more_vert)),
        ],
        bottom: myTabBar(tabController, context),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          Get.toNamed("/contactPage");
        },
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onBackground,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBarView(
          controller: tabController,
          children: [
            ChatList(),
            GroupPage(),
            Text("Calls Page"),
          ]
          ),
      ),
    );
  }
}
