// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutterbloc/cubit/auth_cubit/auth_state.dart';
import 'package:flutterbloc/screen/home_screen.dart';

class VerifyPhoneNumberScreen extends StatelessWidget {
  VerifyPhoneNumberScreen({super.key});

  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Phone Number'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "6-Digit OTP",
                      counterText: "",
                    ),
                  ),
                  const SizedBox(height: 50),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLoggedInState) {
                        Navigator.popUntil(
                          context,
                          (route) => route.isFirst,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } else if (state is AuthErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            duration: const Duration(milliseconds: 2000),
                            content: Text(
                              state.error,
                            ),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            // print(otpController);
                            BlocProvider.of<AuthCubit>(context).verifyOTP(
                              otpController.text,
                            );
                          },
                          child: const Text(
                            'Verify Phone Number',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
