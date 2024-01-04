import 'package:flutter/material.dart';
import 'package:flutterbloc/screen/home_screen.dart';

class VerifyPhoneNumberScreen extends StatelessWidget {
  const VerifyPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Phone Number'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextField(
                    maxLength: 6,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "6-Digit OTP",
                      counterText: "",
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                            (route) => false);
                      },
                      child: const Text(
                        'Verify Phone Number',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
