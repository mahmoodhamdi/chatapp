import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonTitle, required this.color, this.onPressed,
  });
  final String buttonTitle;
  final Color color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation: 10,color: color,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 350,
          height: 42,
          child: Text(
            buttonTitle,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
