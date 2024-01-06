import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/cubit_manager/thirst_cubit.dart';

class ThirstScreen extends StatelessWidget {
  const ThirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thirst Screen'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<ThirstCubit, int>(
            builder: (context, state) {
              return Text(
                state.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ThirstCubit>(context).increment();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
