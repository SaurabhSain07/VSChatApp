import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:vschatapp/Controller/profileController.dart';
import 'package:vschatapp/Model/GroupModel.dart';
import 'package:vschatapp/Model/userModel.dart';
import 'package:vschatapp/pages/homePage/home_page.dart';

class GroupController extends GetxController{
  RxList <UserModel> groupMembers=<UserModel>[].obs;
  final db=FirebaseFirestore.instance;
  final auth=FirebaseAuth.instance;
  var uuid=Uuid();
  RxBool isLoading=false.obs;
  ProfileController profileController=Get.put(ProfileController());

  void selectMembers(UserModel user){
    if (groupMembers.contains(user)) {
      groupMembers.remove(user);
    } else {
      groupMembers.add(user);
    }
  }

  Future <void> createGroup(String groupName, String imagePath)async{
    isLoading.value=true;
    String groupId=uuid.v6();
      
      try {
        String imageUrl=await profileController.uploadeFileToFirebase(imagePath);
      
      await db.collection("groups").doc(groupId).set(
     {
      "id": groupId,
      "name": groupName,
      "profileUrl": imageUrl,
      "members": groupMembers.map((e) => e.toJson()).toList(),
      "createdAt": DateTime.now().toString(),
      "createdBy": auth.currentUser!.uid,
      "timeStamp": DateTime.now().toString()
     }
  );
  // Group create tost
  Get.snackbar("Group Created", "Group create successfully");
  Get.offAll(HomePage());
  isLoading.value=false;
      } catch (e) {
        print(e);
      }
  }
}