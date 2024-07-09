import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  RxString selectImagePath="".obs;
  ProfileController profileController=Get.put(ProfileController());

  String getRoomId(String tergetUserId){
    String currentUserId=auth.currentUser!.uid;
    if (currentUserId[0].codeUnitAt(0) > tergetUserId[0].codeUnitAt(0)) {
      return currentUserId + tergetUserId;
    } else {
      return tergetUserId + currentUserId;
    }
  }

  UserModel getSender(UserModel currentUser, UserModel targetUser) {
    String currentUserId = currentUser.id!;
    String targetUserId = targetUser.id!;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUser;
    } else {
      return targetUser;
    }
  }

  UserModel getReciver(UserModel currentUser, UserModel targetUser) {
    String currentUserId = currentUser.id!;
    String targetUserId = targetUser.id!;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return targetUser;
    } else {
      return currentUser;
    }
  }
  
  // for Send Messages
  Future<void> sendMessage(
      String targetUserId, String message, UserModel targetUser) async {
    isLoading.value = true;
    String chatId = uuid.v6();
    String roomId = getRoomId(targetUserId);
    DateTime timestamp = DateTime.now();
    String nowTime = DateFormat('hh:mm a').format(timestamp);

    UserModel sender = getSender(profileController.currentUser.value, targetUser);
    UserModel receiver = getReciver(profileController.currentUser.value, targetUser);
    
    RxString imageUrl="".obs;
    if (selectImagePath.isNotEmpty) {
      imageUrl.value =
          await profileController.uploadeFileToFirebase(selectImagePath.value);
    }
    var newChat = ChatModel(
      id: chatId,
      message: message,
      imageUrl: imageUrl.value,
      senderId: auth.currentUser!.uid,
      receiverId: targetUserId,
      senderName: profileController.currentUser.value.name,
      timestamp: DateTime.now().toString(),
    );

    var roomDetails = ChatRoomModel(
      id: roomId,
      lastMessage: message,
      lastMessageTimestamp: nowTime,
      sender: sender,
      receiver: receiver,
      timestamp: DateTime.now().toString(),
      unReadMessNo: 0,
    );
    selectImagePath.value="";
    try {
      await db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .doc(chatId)
          .set(
            newChat.toJson(),
          );
      await db.collection("chats").doc(roomId).set(
            roomDetails.toJson(),
          );
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
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