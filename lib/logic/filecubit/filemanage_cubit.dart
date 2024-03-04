import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_drive_clone/logic/bloc/file/filebloc_bloc.dart';
import 'package:google_drive_clone/models/file.dart';
import 'package:meta/meta.dart';
import 'package:file_picker/file_picker.dart';
import 'package:quickly/quickly.dart';

part 'filemanage_state.dart';

class FilemanageCubit extends Cubit<FilemanageState> {
  FilemanageCubit() : super(FilemanageInitial());

  Future<void> selectAndUpload(BuildContext context, parentId) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      List<FileModel> fileModels = [];
      for (File f in files) {
        fileModels.add(
          FileModel(
              fileName: f.path.fileName,
              mimeType: f.path.fileName.split('.').last,
              fileSize: f.length().toString()),
        );
      }
      // context.read<FileBloc>().add(FileBlocAddFile(fileModels));
    }
  }
}
