import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' hide GetNumUtils;
import 'package:google_drive_clone/logic/bloc/auth/auth_bloc.dart';
import 'package:google_drive_clone/logic/bloc/file/filebloc_bloc.dart';
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
    // Timer(
    //   3.seconds,
    //   () => Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (ctx) => const LoginPage()),
    //   ),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Authentication Successful"),
              ),
            );
            context.read<FileBloc>().add(FileBlocFetch());

            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (ctx) => const MainScreen()));
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const LoginPage(),
              ),
            );
          }
        },
        child: Scaffold(
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
        ));
  }
}
