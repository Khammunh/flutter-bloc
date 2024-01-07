import 'package:flutter/material.dart';

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
        child: ListView(),
      ),
    );
  }
}
