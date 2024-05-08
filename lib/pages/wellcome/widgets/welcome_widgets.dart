import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vschatapp/configur/Colors.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/configur/string.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AssetsImage.appIconSVG,
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text(
              AppString.appName,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: dOnSecondry),
            )
          ],
        );
  }
}