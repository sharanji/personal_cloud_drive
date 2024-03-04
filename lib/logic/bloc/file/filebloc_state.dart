part of 'filebloc_bloc.dart';

@immutable
abstract class FileblocState {}

class FileblocInitial extends FileblocState {}

class FileblocError extends FileblocState {}

class FileblocSuccess extends FileblocState {
  Map<int, List<FileModel>> files;
  FileblocSuccess(this.files);
}

class FileblocLoading extends FileblocState {}
