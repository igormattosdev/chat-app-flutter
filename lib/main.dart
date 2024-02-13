import 'package:flutter/material.dart';
import 'package:minimal_chat_app/services/auth/auth_gate.dart';
import 'package:minimal_chat_app/services/auth/login_or_register.dart';
import 'package:minimal_chat_app/firebase_options.dart';
import 'package:minimal_chat_app/pages/login_page.dart';
import 'package:minimal_chat_app/pages/register_page.dart';
import 'package:minimal_chat_app/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: lightMode,
    );
  }
}
