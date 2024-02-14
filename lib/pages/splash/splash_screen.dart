import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' hide GetNumUtils;
import 'package:google_drive_clone/pages/auth/loginScreen.dart';
import 'package:google_drive_clone/pages/pages.dart';
import 'package:quickly/quickly.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(3.seconds, () => Get.to(() => const LoginPage()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SvgPicture.asset("assets/icons/google-drive.svg", width: 150),
          100.hBox(),
          const Text('Personal Server').white.xl5.opacity20,
          100.hBox(),
        ],
      ).center,
    );
  }
}
