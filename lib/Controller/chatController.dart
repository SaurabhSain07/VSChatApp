import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:vschatapp/Controller/profileController.dart';
import 'package:vschatapp/Model/ChatRoomModel.dart';
import 'package:vschatapp/Model/chatModel.dart';
import 'package:vschatapp/Model/userModel.dart';

class ChatController extends GetxController{
  final auth=FirebaseAuth.instance;
  final db= FirebaseFirestore.instance;
  RxBool isLoading=false.obs;
  var uuid = Uuid();
  ProfileController profileController=Get.put(ProfileController());

  String getRoomId(String tergetUserId){
    String currentUserId=auth.currentUser!.uid;
    if (currentUserId[0].codeUnitAt(0) > tergetUserId[0].codeUnitAt(0)) {
      return currentUserId + tergetUserId;
    } else {
      return tergetUserId + currentUserId;
    }
  }
  
  // for Send Messages
  Future<void> sendMessage(String tergetUserId, String message, UserModel tergetUser)async{
    isLoading.value=true;
    String roomId = getRoomId(tergetUserId);
    String chatId=uuid.v6();
    var newChat=ChatModel(
      id: chatId,
      message: message,
      senderId: auth.currentUser!.uid,
      receiverId: tergetUserId,
      senderName: profileController.currentUser.value.name,
      timestamp: DateTime.now().toString(),
    );

    var roomDetails= ChatRoomModel(
      id: roomId,
      lastMessage: message,
      lastMessageTimestamp: DateTime.now().toString(),
      sender: profileController.currentUser.value,
      receiver: tergetUser,
      timestamp: DateTime.now().toString(),
      unReadMessNo: 0,
    );
    try {
      await db.collection("chats").doc(roomId)
      .set(roomDetails.toJson(),
      );

      // for main Messages
      await db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .doc(chatId)
          .set(newChat.toJson());
    } catch (e) {
      print(e);
    }
    isLoading.value=false;
  }
  
  // for Show Messages on Screen
  Stream<List<ChatModel>> getMessage(String tergetUserId) {
    String roomId = getRoomId(tergetUserId);
    return db
        .collection("chats")
        .doc(roomId)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((docs) => ChatModel.fromJson(docs.data()))
            .toList());
  }
}