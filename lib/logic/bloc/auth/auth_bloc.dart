import 'package:bloc/bloc.dart';
import 'package:google_drive_clone/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/logindetails.dart';
import '../../repository/auth.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthCheck>(authCheck);
    on<TryLogin>(tryLogin);
  }

  Future tryLogin(event, state) async {
    emit(AuthLoading());
    Map loginData = event.data;

    Logindetails? logedIn = Logindetails(
        userId: 1,
        firstName: 'sharanji',
        lastName: 'p',
        userName: loginData['email'],
        message: 'good boy',
        contactNumber: '87777777',
        attachmentId: 0);
    // await AuthRepository.login(loginData);
    if (logedIn == null) {
      emit(AuthFailure("Invalid Username or password"));
      return;
    }

    emit(AuthSuccess(logedIn));
  }

  Future authCheck(event, state) async {}
}
