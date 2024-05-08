import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:vschatapp/configur/Colors.dart';
import 'package:vschatapp/configur/images.dart';
import 'package:vschatapp/configur/string.dart';
import 'package:vschatapp/pages/wellcome/widgets/welcome_body.dart';
import 'package:vschatapp/pages/wellcome/widgets/welcome_widgets.dart';
import 'package:vschatapp/pages/wellcome/widgets/welcomefooter_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WelcomeWidget(),
              WelcomeBody(),
              WelcomeFooterButton()
            ],
          ),
        ),
      ),
    );
  }
}
