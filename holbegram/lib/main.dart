import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import './screens/upload_image_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holbegram',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignUp(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        usernameController: TextEditingController(),
        passwordConfirmController: TextEditingController(),
      ),
    );
  }
}
