import 'package:flutter/material.dart';
import 'package:homescreen/services/auth.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 75, 179, 137),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'UniMeet',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to UniMeet!',
                style: TextStyle(
                  color: Color.fromARGB(255, 75, 179, 137),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please sign in to continue',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'UniMeet')),
                );
                   //AuthMethods().signInGoogle(context);
                },
                child: Image.asset(
                  "assets/google.png",
                  height: 45, width: 45,
                  )
                ),
            ],
          ),
        ),
      ),
    );
  }
}