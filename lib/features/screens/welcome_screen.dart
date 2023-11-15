import 'package:chatapp/constants/colors.dart';
import 'package:chatapp/features/screens/sign_in_screen.dart';
import 'package:chatapp/features/screens/sign_up_screen.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});
  static const String route = "/WelcomeView";
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
            CustomButton(
                buttonTitle: "Sign In",
                color: MyColors.primaryLight,
                onPressed: () =>
                    Navigator.pushNamed(context, SignInPage.route)),
            CustomButton(
                buttonTitle: "Sign Up",
                color: Colors.blueGrey,
                onPressed: () =>
                    Navigator.pushNamed(context, SignUpPage.route)),
          ],
        ),
      ),
    );
  }
}
