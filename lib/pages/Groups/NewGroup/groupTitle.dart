import 'package:flutter/material.dart';

class GroupTitle extends StatelessWidget {
  const GroupTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("New Group")),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10)
            ),
          )
        ],
      ),
    );
  }
}