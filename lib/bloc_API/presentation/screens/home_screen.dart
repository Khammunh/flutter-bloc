import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc_API/data/logic/post_cubit/post_cubit.dart';

import '../../data/logic/post_cubit/post_state.dart';

class HomeScreeAPI extends StatelessWidget {
  const HomeScreeAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Learn API Handling'),
      ),
      body: SafeArea(
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PostLoadedState) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      state.posts[index].title.toString(),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: Text('An error occurred!'),
            );
          },
        ),
      ),
    );
  }
}
