import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vschatapp/configur/Colors.dart';
import 'package:vschatapp/configur/images.dart';

import '../../../Controller/profileController.dart';

class LoginUserInfo extends StatelessWidget {
  const LoginUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController=Get.put(ProfileController());
    return Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),

              child: Column( 

                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Image.asset(
                      AssetsImage.boy,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() => Text(
                    profileController.currentUser.value.name! ==null
                    ? "Usre"
                    : profileController.currentUser.value.name!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() => Text(
                     profileController.currentUser.value.email! == null
                    ? "ss@gmail.com"
                    : profileController.currentUser.value.email!,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: dBackgroundColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Wrap(
                            children: [
                              SvgPicture.asset(
                                AssetsImage.phoneSVG,
                                width: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Call",
                                style: TextStyle(color: dOnGreen),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: dBackgroundColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Wrap(
                            children: [
                              SvgPicture.asset(
                                AssetsImage.cameraSVG,
                                width: 25,
                                color: dOnSecondry,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Video",
                                style: TextStyle(color: dOnSecondry),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                      height: 50,
                        decoration: BoxDecoration(
                            color: dBackgroundColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Wrap(
                            children: [
                              SvgPicture.asset(
                                AssetsImage.appIconSVG,
                                width: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Chat",
                                style: TextStyle(color: dPrimaryColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
  }
}