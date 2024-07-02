import 'package:get/get.dart';
import 'package:vschatapp/pages/Auth/auth_page.dart';
import 'package:vschatapp/pages/ContactPage/contactPage.dart';
import 'package:vschatapp/pages/UserProfile/Profile.dart';
import 'package:vschatapp/pages/UserProfile/Widgets/updateProfile.dart';
import 'package:vschatapp/pages/homePage/home_page.dart';

var pagePath = [
  GetPage(
    name: "/authPage",
     page: () =>const AuthPage(),
      transition: Transition.rightToLeft,
     ),

  GetPage(
    name: "/homePage",
     page: () => HomePage(),
      transition: Transition.rightToLeft,
     ),    
  
  GetPage(
    name: "/profilePage",
     page: () =>const UserProfilePage(),
      transition: Transition.rightToLeft,
     ),

  GetPage(
    name: "/contactPage",
     page: () =>const ContactPage(),
      transition: Transition.rightToLeft,
     ),   
  
  // GetPage(
  //   name: "/updateProfile",
  //    page: () => const UserUpdateProfile(),
  //     transition: Transition.rightToLeft,
  //    )
];
