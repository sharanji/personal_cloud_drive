import 'package:flutter/material.dart';
import 'package:google_drive_clone/utils/constant.dart';
import 'package:google_drive_clone/widgets/widgets.dart';
import 'package:quickly/quickly.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingButton(),
      body: pages[selectedIndex],
      bottomNavigationBar: bottomBar(),
    );
  }

  BottomNavigationBar bottomBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (v) => setState(() => selectedIndex = v),
      selectedItemColor: FxColor.gray200,
      unselectedItemColor: FxColor.gray500,
      iconSize: 25,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Stareed',
          icon: Icon(Icons.star_border_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Shared',
          icon: Icon(Icons.group),
        ),
        BottomNavigationBarItem(
          label: 'Files',
          icon: Icon(Icons.folder),
        ),
      ],
    );
  }
}
