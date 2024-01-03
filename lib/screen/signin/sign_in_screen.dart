// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class SingInScreen extends StatelessWidget {
  const SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sing In with Email',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Email Address'),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.all(10),
              ),
              onPressed: () {},
              child: const Text(
                'Sing in',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
