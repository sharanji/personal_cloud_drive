import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_drive_clone/logic/bloc/auth/auth_bloc.dart';
import 'package:google_drive_clone/logic/bloc/file/filebloc_bloc.dart';
import 'package:google_drive_clone/logic/filecubit/filemanage_cubit.dart';
import 'package:google_drive_clone/pages/pages.dart';

late int userId = 0;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthCheck()),
        ),
        BlocProvider(
          create: (context) => FilemanageCubit(),
        ),
        BlocProvider(
          create: (context) => FileBloc()..add(FileBlocInit()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.dark,
        home: const SplashScreen(),
      ),
    );
  }
}
