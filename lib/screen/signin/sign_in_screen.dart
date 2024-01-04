// ignore_for_file: avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/screen/signin/sign_in_bloc.dart';
import 'package:flutterbloc/screen/signin/sign_in_event.dart';
import 'package:flutterbloc/screen/signin/sign_in_state.dart';

class SingInScreen extends StatelessWidget {
  SingInScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sing In with Email',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            TextField(
              controller: emailController,
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(
                  SignInTextChangedEvent(
                    emailValue: emailController.text,
                    passwordValue: passwordController.text,
                  ),
                );
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'Email Address'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(
                  SignInTextChangedEvent(
                    emailValue: emailController.text,
                    passwordValue: passwordController.text,
                  ),
                );
              },
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(height: 80),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (state is SignInInValidState)
                        ? Colors.blue
                        : Colors.grey,
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: () {
                    if (state is SignInInValidState) {
                      BlocProvider.of<SignInBloc>(context).add(
                        SignInSubmittedEvent(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Sing in',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
