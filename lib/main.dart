import 'package:conforthourse/pages/faqs.dart';
import 'package:conforthourse/pages/login.dart';
import 'package:conforthourse/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:conforthourse/colors.dart';
import 'package:conforthourse/pages/home.dart';
import 'package:video_player/video_player.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
