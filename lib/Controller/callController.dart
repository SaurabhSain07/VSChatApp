import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:vschatapp/Model/userModel.dart';

import '../Model/AudioCall.dart';

class CallController extends GetxController{
  final db=FirebaseFirestore.instance;
  final auth=FirebaseAuth.instance;
  final uuid=Uuid().v4();

  void onInti(){
    super.onInit();
    getCallsNotification().listen((snapshort) { 
      if (snapshort.docs.isNotEmpty) {
        Get.snackbar("Calling", "Calling");
      }
    });
  }

  Future<void> CallAction(UserModel reciver, UserModel caller)async{
    String id=uuid;
    var newCall=CallModel(
      id: id,
      callerName: caller.name,
      callerPic: caller.profileImage,
      callerUid: caller.id,
      callerEmail: caller.email,
      receiverName: reciver.name,
      receiverPic: reciver.profileImage,
      receiverUid: reciver.id,
      receiverEmail: reciver.email,
      status: "dialing"
    );

    try {
      await db
          .collection("notification")
          .doc(reciver.id)
          .collection("call")
          .doc(id)
          .set(newCall.toJson());
    } catch (e) {
      print(e);
    }
  }
  
  Stream<QuerySnapshot> getCallsNotification() {
    return db
        .collection("notification")
        .doc(auth.currentUser!.uid)
        .collection("call")
        .snapshots();
  }
}