import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:vschatapp/Model/userModel.dart';

class ProfileController extends GetxController{
  final auth=FirebaseAuth.instance;
  final db=FirebaseFirestore.instance;
  final store = FirebaseStorage.instance;
  RxBool isLoading = false.obs;
  Rx<UserModel> currentUser=UserModel().obs;

  void onInit() async {
    super.onInit();
    await getUserDetails();
  }

  Future<void> getUserDetails() async {
    await db.collection("users").doc(auth.currentUser!.uid).get().then(
          (value) => {
            currentUser.value = UserModel.fromJson(
              value.data()!,
            ),
          },
        );
  }

      Future<void> updateProfile(
        String name,
        String imageUrl,
        String about,
        String number) async {
          isLoading.value=true;
        try {
          final imageLink=await uploadFileToFirebase(imageUrl);
          final updateUser=UserModel(
          id: auth.currentUser!.uid,
          email: auth.currentUser!.email,
          name: name,
          about: about,
          profileImage: imageUrl=="" ?currentUser.value.profileImage : imageLink,
          phoneNumber: number
        );
        await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .set(updateUser.toJson());
        await getUserDetails();
        } catch (e) {
          print(e);
        }
        isLoading.value=false;
      }    

        Future<String>uploadFileToFirebase(String imagePath)async{
            final path="file${imagePath}";
            final file=File(imagePath!);
          if (imagePath!="") {
            try {
            final ref=store.ref().child(path).putFile(file);
            final uploadeTask=await ref.whenComplete((){});
            final downloadeImageUrl=await uploadeTask.ref.getDownloadURL();
            print(downloadeImageUrl);
            return downloadeImageUrl;
          } catch (e) {
           print(e);
           return "";
          }
        }
        return "";
      }

  
}