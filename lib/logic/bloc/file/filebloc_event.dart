part of 'filebloc_bloc.dart';

@immutable
abstract class FileblocEvent {}

class FileBlocInit extends FileblocEvent {}

class FileBlocFetch extends FileblocEvent {
  int parentId;
  FileBlocFetch({this.parentId = 0});
}

class FileBlocAddFile extends FileblocEvent {
  List<FileModel> files;
  int parentId;
  FileBlocAddFile(this.files, this.parentId);
}

class FilepagePop extends FileblocEvent {}
