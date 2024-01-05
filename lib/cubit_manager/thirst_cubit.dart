import 'package:flutter_bloc/flutter_bloc.dart';

class ThirstCubit extends Cubit<int> {
  ThirstCubit() : super(0);

  void increment() => emit(state + 1);
}
