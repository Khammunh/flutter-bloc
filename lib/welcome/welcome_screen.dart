// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/screen/signin/sign_in_bloc.dart';
import 'package:flutterbloc/screen/signin/sign_in_screen.dart';
import 'package:flutterbloc/screen/signin_phone/sign_in_screen_phone.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Learn Bloc',
          style: TextStyle(
            fontSize: 30,
            color: Colors.blue,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.all(10),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => SignInBloc(),
                      child: SingInScreen(),
                    ),
                  ),
                );
              },
              child: const Text(
                'Sign in with Email',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.all(10),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => SignInBloc(),
                      child: SignInScreenPhone(),
                    ),
                  ),
                );
              },
              child: const Text(
                'Sign in with Phone OTP',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.all(10),
              ),
              onPressed: () {},
              child: const Text(
                'Sign in with Google',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
