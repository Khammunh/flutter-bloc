import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/cubit_manager/first_cubit.dart';
import 'package:flutterbloc/cubit_manager/second_cubit.dart';
import 'package:flutterbloc/cubit_manager/thirst_cubit.dart';
import 'package:flutterbloc/screen/screen_manager/first_screen.dart';
import 'package:flutterbloc/screen/screen_manager/second_screen.dart';
import 'package:flutterbloc/screen/screen_manager/thirst_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/first":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => FirstCubit(),
            child: const FirstScreen(),
          ),
        );
    }
    switch (settings.name) {
      case "/second":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SecondCubit(),
            child: const SecondScreen(),
          ),
        );
    }
    switch (settings.name) {
      case "/thirst":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ThirstCubit(),
            child: const ThirstScreen(),
          ),
        );
    }
    return null;
  }
}
