import 'package:firebase_core/firebase_core.dart';
import 'package:what_to_do_app/auth/pages/auth_gate.dart';
import 'package:what_to_do_app/injection_container.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const AuthGate(),
      debugShowCheckedModeBanner: false,
    );
  }
}
