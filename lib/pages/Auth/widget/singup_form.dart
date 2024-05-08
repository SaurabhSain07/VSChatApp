import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vschatapp/widgets/primary_button.dart';

class SingUpForm extends StatelessWidget {
  const SingUpForm({super.key});

  @override
  Widget build(BuildContext context) {
   return Column(
      children: [

        SizedBox(
          height: 40,
        ),
        TextField(
          decoration: InputDecoration(
              hintText: "Full Name",
              prefixIcon: Icon(Icons.person)),
        ),

        SizedBox(
          height: 40,
        ),
        TextField(
          decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.alternate_email_outlined)),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          decoration: InputDecoration(
              hintText: "password", prefixIcon: Icon(Icons.password_outlined)),
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              ontap: (){
                Get.offAllNamed("/homePage");
              },
              btnName: "SINGUP",
              icon: Icons.lock_open_sharp,
            ),
          ],
        )
      ],
    );
  
  }
}