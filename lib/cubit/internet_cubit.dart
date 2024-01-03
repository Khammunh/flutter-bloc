// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { Initial, Lost, Gained }

class InternetCubit extends Cubit<InternetState> {
   Connectivity _connectivity = Connectivity();

  InternetCubit() : super(InternetState.Initial);
}
