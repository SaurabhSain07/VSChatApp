import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vschatapp/Controller/authController.dart';
import 'package:vschatapp/Model/userModel.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/pages/UserProfile/Widgets/login_user_info.dart';
import '../../Controller/profileController.dart';

class UserProfilePage extends StatelessWidget {
  final UserModel userModel;
  const UserProfilePage({super.key, required this.userModel});
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
          LoginUserInfo(
            profileImage: userModel.profileImage ?? AssetsImage.defaultProfileImage,
            userName: userModel.name?? "User",
            userEmail: userModel.email?? "",
          ),
          Spacer(),
          
          ElevatedButton(onPressed: (){
            authController.logoutUser();
          }, child: Text("Logout"))
        ],
      ),
    );
  }
}
