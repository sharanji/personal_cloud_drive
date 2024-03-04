part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  LoginDetails user;
  AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
  String errorMessage;
  AuthFailure(this.errorMessage);
}
