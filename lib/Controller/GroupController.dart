import 'package:get/get.dart';
import 'package:vschatapp/Model/userModel.dart';

class GroupController extends GetxController{
  RxList <UserModel> groupMembers=<UserModel>[].obs;

  void selectMembers(UserModel user){
    if (groupMembers.contains(user)) {
      groupMembers.remove(user);
    } else {
      groupMembers.add(user);
    }
  }
}