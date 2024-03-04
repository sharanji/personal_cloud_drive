import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_drive_clone/logic/bloc/file/filebloc_bloc.dart';
import 'package:google_drive_clone/logic/filecubit/filemanage_cubit.dart';
import 'package:google_drive_clone/pages/components/file_list.dart';
import 'package:quickly/quickly.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isListView = true;

  @override
  void initState() {
    context.read<FileBloc>().add(FileBlocFetch(parentId: 0));
    super.initState();
  }

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
          Expanded(
            child: SingleChildScrollView(
              child: BlocBuilder<FileBloc, FileblocState>(builder: (context, state) {
                if (state is FileblocSuccess) {
                  return Column(
                    children: [
                      ...state.files[0]!.map(
                        (f) => Column(
                          children: [
                            FileList(f),
                            const Divider(),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return const CupertinoActivityIndicator();
              }),
            ),
          ),
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<FilemanageCubit>().selectAndUpload(context, 0);
        },
      ),
    );
  }
}
