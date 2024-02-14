part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthCheck extends AuthEvent {}

class Logout extends AuthEvent {}

class TryLogin extends AuthEvent {
  Map data;
  TryLogin(this.data);
}

class ChangeCurrentUser extends AuthEvent {
  int userID;
  BuildContext context;
  ChangeCurrentUser(this.userID, this.context);
}
