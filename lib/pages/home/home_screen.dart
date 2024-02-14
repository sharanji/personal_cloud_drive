import 'package:flutter/material.dart';
import 'package:quickly/quickly.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: FxColor.dark,
        elevation: 0,
        title: TextFormField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Search ...',
          ),
        ),
        actions: [
          const CircleAvatar(
            radius: 17,
            backgroundColor: FxColor.gray700,
            child: Icon(Icons.person),
          ).pr(20),
        ],
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
                width: 10,
              ),
              const Text('Files'),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isListView = !isListView;
                  });
                },
                child: Icon(isListView ? Icons.list : Icons.grid_view),
              ),
              const SizedBox(
                height: 30,
                width: 10,
              ),
            ],
          ),
          const Divider(),
          ListTile(
            leading: SizedBox(
              width: 60,
              height: 60,
              child: Image.asset('assets/word.png'),
            ),
            title: const Text("Sample-word.doc"),
          ),
          const Divider(),
          ListTile(
            leading: SizedBox(
              width: 60,
              height: 60,
              child: Image.asset('assets/gallery.png'),
            ),
            title: const Text("IMG-675-wed.png"),
          ),
          const Divider(),
          ListTile(
            leading: SizedBox(
              width: 60,
              height: 60,
              child: Image.asset('assets/excel.png'),
            ),
            title: const Text("Sample-excel.doc"),
          ),
          const Divider(),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Personal Drive').xl3.p12,
              const Divider(color: FxColor.gray500),
              ListTile(
                horizontalTitleGap: 0,
                leading: const Icon(Icons.history),
                title: const Text('Recent'),
                onTap: () {},
              )
            ],
          ),
        ),
      ).wBox(250),
    );
  }
}
