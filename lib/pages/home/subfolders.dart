import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_drive_clone/logic/bloc/file/filebloc_bloc.dart';
import 'package:google_drive_clone/logic/filecubit/filemanage_cubit.dart';
import 'package:google_drive_clone/pages/components/file_list.dart';

class SubFolders extends StatefulWidget {
  SubFolders(this.parentId, this.parentName, {Key? key}) : super(key: key);
  int parentId;
  String parentName;
  @override
  State<SubFolders> createState() => _SubFoldersState();
}

class _SubFoldersState extends State<SubFolders> {
  @override
  void initState() {
    context.read<FileBloc>().add(FileBlocFetch(parentId: widget.parentId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: const Icon(
                        Icons.chevron_left,
                        size: 30,
                      ),
                    ),
                  ),
                  Text(
                    widget.parentName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: const Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: BlocBuilder<FileBloc, FileblocState>(builder: (context, state) {
                  if (state is FileblocSuccess) {
                    if (state.files[widget.parentId] == null ||
                        state.files[widget.parentId]!.isEmpty) {
                      return Container(
                        height: 500,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(20),
                        child: const Text("Looks like Empty Folder"),
                      );
                    }
                    return Column(
                      children: [
                        ...state.files[widget.parentId]!.map(
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
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<FilemanageCubit>().selectAndUpload(context, widget.parentId);
        },
      ),
    );
  }
}
