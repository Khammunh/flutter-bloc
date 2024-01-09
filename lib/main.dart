
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc_API/data/logic/post_cubit/post_cubit.dart';
import 'package:flutterbloc/bloc_API/presentation/screens/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // PostRepository postRepository = PostRepository();
  // List<PostModel> postModels = await postRepository.fetchPosts();

  // log(postModels.toString() );
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
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       onGenerateRoute: Routes.onGenerateRoute,
//       initialRoute: "/first",
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreeAPI(),
      ),
    );
  }
}
