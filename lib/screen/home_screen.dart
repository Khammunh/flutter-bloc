import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutterbloc/cubit/auth_cubit/auth_state.dart';
import 'package:flutterbloc/cubit/internet_cubit.dart';

import 'signin_phone/sign_in_screen_phone.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoggedOutState) {
                Navigator.popUntil(
                  context,
                  (route) => route.isFirst,
                );
                 Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreenPhone(),
                          ),
                        );
              }
            },
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).logOut();
                },
                icon: const Icon(
                  Icons.exit_to_app,
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.Gained) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Internet connected!'),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state == InternetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Internet not connected!'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state == InternetState.Gained) {
                return const Text('Connected!');
              } else if (state == InternetState.Lost) {
                return const Text('Not Connected!');
              } else {
                return const Text('Loading...');
              }
            },
          ),
        ),
      ),
    );
  }
}
