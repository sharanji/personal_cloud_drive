import 'dart:async';
import 'package:google_drive_clone/logic/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_drive_clone/pages/home/home_screen.dart';
import 'package:google_drive_clone/pages/main/main_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _saveForm(BuildContext context) async {
    Map loginData = {'userName': _userName.text, 'password': _password.text};
    context.read<AuthBloc>().add(TryLogin(loginData));
  }

  @override
  void initState() {
    super.initState();
  }

  bool online = false;

  final _formKey = GlobalKey<FormBuilderState>();
  bool _enabled = true;
  FocusNode myFocusNode = FocusNode();
  bool hidePassword = true;

  final _userName = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Authentication Successful"),
              ),
            );
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (ctx) => const MainScreen()));
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Invalid Credtentials"),
              ),
            );
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Stack(children: [
              Container(
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 250),
                    const Text(
                      'Welcome Back',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      'Sign in to continue',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Image(
                    //   image: const AssetImage('assets/login.png'),
                    //   width: MediaQuery.of(context).size.width - 100,
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5 * 2,
                        bottom: 5 * 2,
                        left: 2 * 8,
                        right: 2 * 8,
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5 * 2, bottom: 5 * 4, left: 2 * 8, right: 2 * 8),
                          child: FormBuilder(
                            key: _formKey,
                            // initialValue: formInitialValues,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                FormBuilderTextField(
                                  name: 'userName',
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  controller: _userName,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: const OutlineInputBorder(),
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                          color: myFocusNode.hasFocus ? Colors.blue : Colors.black),
                                      prefixIcon:
                                          Icon(Icons.email, color: Theme.of(context).primaryColor)),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter valid email address';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                Container(
                                  height: 30,
                                ),
                                FormBuilderTextField(
                                  name: 'password',
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  controller: _password,
                                  style: const TextStyle(color: Colors.black),
                                  obscureText: hidePassword,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: const OutlineInputBorder(),
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                          color: myFocusNode.hasFocus ? Colors.blue : Colors.black),
                                      prefixIcon:
                                          Icon(Icons.lock, color: Theme.of(context).primaryColor),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              hidePassword = !hidePassword;
                                            });
                                          },
                                          icon: Icon(hidePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    } else if (value.length < 6) {
                                      return 'Password must be atleast 6 characters';
                                    }
                                    return null;
                                  },
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  keyboardType: TextInputType.text,
                                ),
                                const SizedBox(height: 35),
                                GestureDetector(
                                    onTap: _enabled
                                        ? () {
                                            if (_formKey.currentState!.validate()) {
                                              _formKey.currentState!.save();
                                              _saveForm(context);
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content:
                                                    Text('Please provide the correct details.'),
                                              ));
                                            }
                                          }
                                        : null,
                                    child: Container(
                                      width: 200,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color:
                                            _enabled ? Theme.of(context).primaryColor : Colors.grey,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: !_enabled
                                          ? SizedBox(
                                              width: 16,
                                              height: 16,
                                              child: CircularProgressIndicator(
                                                color: Theme.of(context).primaryColor,
                                                strokeWidth: 1.5,
                                              ))
                                          : const Text(
                                              'Sign In',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                    )
                                    // },
                                    )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
      // ),
    );

    // WillPopScope(
    //   onWillPop: () async {
    //     return false;
    //   },
    //   child:
  }
}
