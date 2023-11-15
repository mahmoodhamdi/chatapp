import 'package:chatapp/features/screens/chat_screen.dart';
import 'package:chatapp/features/screens/sign_in_screen.dart';
import 'package:chatapp/features/screens/sign_up_screen.dart';
import 'package:chatapp/features/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        WelcomeView.route: (context) => const WelcomeView(),
        SignUpPage.route: (context) => const SignUpPage(),
        SignInPage.route: (context) => const SignInPage(),
        ChatPage.route: (context) => const ChatPage(),
      },
      initialRoute: WelcomeView.route ,
    );
  }
}
