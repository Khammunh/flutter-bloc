import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/cubit_manager/first_cubit.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => BlocProvider(
              //       create: (context) => SecondCubit(),
              //       child: const SecondScreen(),
              //     ),
              //   ),
              // );
              Navigator.pushNamed(context, "/second");
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<FirstCubit, int>(
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
          BlocProvider.of<FirstCubit>(context).increment();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
