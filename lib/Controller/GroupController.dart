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
  RxList<GroupModel> groupList = <GroupModel>[].obs;
  ProfileController profileController=Get.put(ProfileController());
  
  @override
  void onInit() {
    super.onInit();
    getGroups();
  }

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

  Future<void> getGroups() async {
    isLoading.value = true;
    List<GroupModel> tempGroup = [];
    await db.collection('groups').get().then(
      (value) {
        tempGroup = value.docs
            .map(
              (e) => GroupModel.fromJson(e.data()),
            )
            .toList();
      },
    );
    groupList.clear();
    groupList.value = tempGroup
        .where(
          (e) => e.members!.any(
            (element) => element.id == auth.currentUser!.uid,
          ),
        )
        .toList();
    isLoading.value = false;
  }
}