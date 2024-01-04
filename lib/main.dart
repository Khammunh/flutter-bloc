import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterbloc/cubit/auth_cubit/auth_state.dart';
import 'firebase_options.dart';
import 'screen/signin_phone/sign_in_screen_phone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthCubit, AuthState>(buildWhen: (
          oldState,
          newState,
        ) {
          return oldState is AuthInitialState;
        }, builder: (context, state) {
          if (state is AuthLoggedInState) {
            return SignInScreenPhone();
          } else if (state is AuthLoggedOutState) {
            return SignInScreenPhone();
          } else {
            return const Scaffold();
          }
        }),
      ),
    );
  }
}
