import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:google_drive_clone/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

    Map logedIn = await AuthRepository.login(loginData);
    if (logedIn['data'] == null) {
      emit(AuthFailure(logedIn['message']));
      return;
    }

    userId = logedIn['data'].id;
    emit(AuthSuccess(logedIn['data']));
  }

  Future authCheck(event, state) async {
    final pref = await SharedPreferences.getInstance();
    if (!pref.containsKey('logindata')) {
      emit(AuthFailure('Login to continue'));
      return;
    }

    Map loginData = jsonDecode(pref.getString('logindata')!);
    Map logedIn = await AuthRepository.login(loginData);
    if (logedIn['data'] == null) {
      emit(AuthFailure(logedIn['message']));
      return;
    }

    userId = logedIn['data'].id;
    emit(AuthSuccess(logedIn['data']));
  }
}
