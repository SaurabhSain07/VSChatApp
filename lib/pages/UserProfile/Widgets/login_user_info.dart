import 'dart:ffi';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vschatapp/configur/Colors.dart';
import 'package:vschatapp/configur/images.dart';

import '../../../Controller/profileController.dart';

class LoginUserInfo extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String userEmail;
  const LoginUserInfo({
    super.key,
    required this.profileImage,
    required this.userName,
    required this.userEmail});

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
                    child: Container(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                    imageUrl: profileImage,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    userEmail,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
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