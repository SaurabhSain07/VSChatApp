import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vschatapp/Controller/authController.dart';
import 'package:vschatapp/widgets/primary_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    AuthController authController = Get.put(AuthController());
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.alternate_email_outlined)),
        ),
        const SizedBox(
          height: 30,
        ),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(
              hintText: "password", prefixIcon: Icon(Icons.password_outlined)),
        ),
        const SizedBox(
          height: 50,
        ),
        Obx(() => authController.isLoading.value
            ? CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(
                    ontap: () {
                      authController.login(
                          emailController.text, passwordController.text);
                      // Get.offAllNamed("/homePage");
                    },
                    btnName: "LOGIN",
                    icon: Icons.lock_open_sharp,
                  ),
                ],
              )
            )
      ],
    );
  }
}
