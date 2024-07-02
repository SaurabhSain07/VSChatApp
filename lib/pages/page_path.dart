
import 'package:get/get.dart';
import 'package:vschatapp/pages/Auth/auth_page.dart';
import 'package:vschatapp/pages/Chats/chatPage.dart';
import 'package:vschatapp/pages/ContactPage/contactPage.dart';
import 'package:vschatapp/pages/UserProfile/Profile.dart';
import 'package:vschatapp/pages/UserProfile/Widgets/updateProfile.dart';
import 'package:vschatapp/pages/homePage/home_page.dart';

var pagePath = [
  GetPage(
    name: "/authPage",
     page: () => AuthPage(),
      transition: Transition.rightToLeft,
     ),

  GetPage(
    name: "/homePage",
     page: () => HomePage(),
      transition: Transition.rightToLeft,
     ),   

  GetPage(
    name: "/chatPage",
     page: () => ChatPage(),
      transition: Transition.rightToLeft,
     ),   
  
  GetPage(
    name: "/profilePage",
     page: () => UserProfilePage(),
      transition: Transition.rightToLeft,
     ),

  GetPage(
    name: "/contactPage",
     page: () => ContactPage(),
      transition: Transition.rightToLeft,
     ),   
  
  GetPage(
    name: "/updateProfile",
     page: () => UserUpdateProfile(),
      transition: Transition.rightToLeft,
     )
];
