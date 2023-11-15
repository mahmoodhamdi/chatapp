import 'package:chatapp/features/screens/chat_screen.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/form_email.dart';
import 'package:chatapp/widgets/form_password.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const String route = "/SignUpPage";
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/unnamed.png",
                  height: 200,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Message Me",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            FormEmailField(),
            const SizedBox(
              height: 10,
            ),
            const FormPasswordField(),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              buttonTitle: "Sign Up",
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.pushNamed(context, ChatPage.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
