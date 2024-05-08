import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vschatapp/configur/Colors.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/configur/string.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsImage.boy,
              width: 80,
              height: 80,
            ),
            SvgPicture.asset(AssetsImage.connectSVG),
            Image.asset(
              AssetsImage.girl,
              width: 80,
              height: 80,
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          WelcomePageString.nowYouAre,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          WelcomePageString.connected,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: dOnSecondry),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          WelcomePageString.discription,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
