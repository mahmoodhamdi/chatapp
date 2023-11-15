import 'package:chatapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
            const CustomButton(
              buttonTitle: "Sign In",
              color: Colors.blueAccent,
            ),
            const CustomButton(
              buttonTitle: "Sign Up",
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
