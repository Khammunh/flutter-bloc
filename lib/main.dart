import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/cubit_manager/first_cubit.dart';
import 'package:flutterbloc/screen/screen_manager/first_screen.dart';
import 'firebase_options.dart';
import 'screen/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AuthCubit(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: BlocBuilder<AuthCubit, AuthState>(buildWhen: (
//           oldState,
//           newState,
//         ) {
//           return oldState is AuthInitialState;
//         }, builder: (context, state) {
//           if (state is AuthLoggedInState) {
//             return SignInScreenPhone();
//           } else if (state is AuthLoggedOutState) {
//             return SignInScreenPhone();
//           } else {
//             return const Scaffold();
//           }
//         }),
//       ),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: "/first",
    );
  }
}
