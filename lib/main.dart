import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
    apiKey: 'key',
    appId: 'id',
    messagingSenderId: 'sendid',
    projectId: 'myapp',
    storageBucket: 'myapp-b9yt18.appspot.com',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
