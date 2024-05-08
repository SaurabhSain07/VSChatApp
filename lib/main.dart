import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vschatapp/configur/Theme.dart';
import 'package:vschatapp/pages/page_path.dart';
import 'package:vschatapp/pages/splace_screen/splace_sareen.dart';
import 'package:vschatapp/pages/wellcome/wellcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VsChatapp',
      theme: lightTheme,
      getPages: pagePath,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: WelcomeScreen(),
    );
  }
}

