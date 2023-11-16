// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chatapp/constants/colors.dart';
import 'package:chatapp/features/screens/chat_screen.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/form_email.dart';
import 'package:chatapp/widgets/form_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  static const String route = "/SignInPage";
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late String email;
  late String password;
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
              FormPasswordField(onChanged: (p0) => password = p0),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  buttonTitle: "Sign In",
                  color: Colors.blueGrey,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      void signIn(BuildContext context) async {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email, password: password);
                          Navigator.pushNamed(context, ChatPage.route);
                          AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.success,
                                  animType: AnimType.rightSlide,
                                  title: 'Welcome Back ❤️‍🔥',
                                  buttonsBorderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  btnOkOnPress: () {})
                              .show();
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    padding: EdgeInsets.all(16),
                                    backgroundColor: MyColors.primare,
                                    content:
                                        Text("No user found for that email.")));
                          } else if (e.code == 'wrong-password') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    padding: EdgeInsets.all(16),
                                    backgroundColor: MyColors.primare,
                                    content: Text(
                                        "Wrong password provided for that user.")));
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())));
                        }
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
