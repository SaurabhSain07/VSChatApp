import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vschatapp/Controller/authController.dart';
import 'package:vschatapp/configur/Colors.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/pages/Profile/Widgets/login_user_info.dart';

import '../../Controller/profileController.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
  
  AuthController authController=Get.put(AuthController());
  ProfileController profileController=Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(onPressed: (){
            Get.toNamed("/updateProfile");
          }, icon: Icon(Icons.edit))
        ],
        ),
      body: Column(
        children: [
          LoginUserInfo(),
          Spacer(),
          
          ElevatedButton(onPressed: (){
            authController.logoutUser();
          }, child: Text("Logout"))
        ],
      ),
    );
  }
}
