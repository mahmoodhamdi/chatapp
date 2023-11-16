// ignore_for_file: use_build_context_synchronously

import 'package:chatapp/constants/colors.dart';
import 'package:chatapp/features/screens/chat_screen.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/form_email.dart';
import 'package:chatapp/widgets/form_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const String route = "/SignUpPage";
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: formKey,
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
              FormEmailField(
                onChanged: (p0) => email = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              FormPasswordField(
                onChanged: (p0) => password = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  buttonTitle: "Sign Up",
                  color: Colors.blueGrey,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                        Navigator.pushNamed(context, ChatPage.route);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'email-already-in-use') {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              padding: EdgeInsets.all(16),
                              backgroundColor: MyColors.primare,
                              content: Text(
                                  "The account already exists for that email.")));
                        } else if (e.code == 'weak-password') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  padding: EdgeInsets.all(16),
                                  backgroundColor: MyColors.primare,
                                  content: Text(
                                      "The password provided is too weak.")));
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
