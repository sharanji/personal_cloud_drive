import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:google_drive_clone/logic/repository/files.dart';
import 'package:google_drive_clone/models/file.dart';
import 'package:meta/meta.dart';

part 'filebloc_event.dart';
part 'filebloc_state.dart';

class FileBloc extends Bloc<FileblocEvent, FileblocState> {
  Map<int, List<FileModel>> files = {};
  FileBloc() : super(FileblocInitial()) {
    on<FileBlocInit>(inital);
    on<FileBlocAddFile>(addFile);
    on<FileBlocFetch>(filesFetch);
  }

  Future inital(event, _) async {
    emit(FileblocSuccess(files));
  }

  Future addFile(FileBlocAddFile event, state) async {
    emit(FileblocLoading());
    if (files[event.parentId] == null) {
      files[event.parentId] = [];
    }

    for (var i = 0; i < event.files.length; i++) {
      files[event.parentId]!.add(event.files[i]);
    }
    emit(FileblocSuccess(files));
  }

  Future filesFetch(FileBlocFetch event, state) async {
    emit(FileblocLoading());
    List<FileModel>? fetchedFiles = await FileRepository.fetchFiles(event.parentId);
    if (fetchedFiles == null) {
      emit(FileblocError());
      return;
    }
    files[event.parentId] = fetchedFiles;
    emit(FileblocSuccess(files));
  }
}
