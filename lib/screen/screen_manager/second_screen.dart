import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/cubit_manager/second_cubit.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/thirst");
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<SecondCubit, int>(
            builder: (context, state) {
              return Text(
                state.toString(),
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<SecondCubit>(context).increment();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
