// ignore_for_file: must_be_immutable

import 'package:chatapp/constants/colors.dart';
import 'package:flutter/material.dart';

class FormPasswordField extends StatefulWidget {
  FormPasswordField({super.key, this.onChanged});
  void Function(String)? onChanged;
  @override
  State<FormPasswordField> createState() => _FormPasswordFieldState();
}

class _FormPasswordFieldState extends State<FormPasswordField> {
  _FormPasswordFieldState();
  bool isObscure = true;

  Widget? lock(bool isObscure) {
    if (isObscure == true) {
      return const Icon(Icons.lock_outline, size: 20, color: MyColors.mainText);
    } else {
      return const Icon(Icons.lock_open_outlined,
          size: 20, color: MyColors.mainText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 380,
        height: 60,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: TextFormField( 
          onChanged:widget.onChanged,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your password';
            } else {
              return null;
            }
          },
          cursorColor: MyColors.mainText,
          obscureText: isObscure,
          enableSuggestions: false,
          autocorrect: false,
          style: const TextStyle(
            color: MyColors.primare,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: const TextStyle(
              color: Color(0xFF868889),
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.45,
            ),
            prefixIcon: const Icon(
              Icons.lock_outlined,
              color: MyColors.mainText,
            ),
            suffix: IconButton(
              icon: lock(isObscure)!,
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.mainText, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.mainText, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.mainText, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ));
  }
}
