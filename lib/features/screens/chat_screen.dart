import 'package:chatapp/constants/colors.dart';
import 'package:chatapp/features/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  static const String route = "/ChatPage";
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryLight,
        title: Row(
          children: [
            Image.asset(
              "assets/images/unnamed.png",
              height: 35,
            ),
            const SizedBox(
              width: 15,
            ),
            const Text("Message ME")
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              //log out function
              Navigator.pushNamed(context, WelcomeView.route);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: SafeArea(
          child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(width: 2, color: MyColors.primaryLight),
              )),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 22, horizontal: 14),
                          hintText: "Write Your Message  here"),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      textEditingController.clear();
                    },
                    child: const Text(
                      "Send",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
