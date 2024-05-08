import 'package:flutter/material.dart';

class SplaceScreen extends StatelessWidget {
  const SplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "VSChatApp",
        style: Theme.of(context).textTheme.headlineSmall,
      )),
    );
  }
}
