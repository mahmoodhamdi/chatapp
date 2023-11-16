// ignore_for_file: must_be_immutable

import 'package:chatapp/constants/colors.dart';
import 'package:flutter/material.dart';

class FormEmailField extends StatelessWidget {
  FormEmailField({super.key, this.onChanged});
  void Function(String)? onChanged;
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
          keyboardType: TextInputType.emailAddress,
          onChanged: onChanged,
          validator: (value) {
            if (value!.isEmpty) {
              return "the Email is requierd";
            }
            return null;
          },
          cursorColor: MyColors.mainText,
          style: const TextStyle(
            color: MyColors.primare,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.mail_outline,
              color: MyColors.mainText,
            ),
            hintText: 'Email Address',
            hintStyle: TextStyle(
              color: Color(0xFF868889),
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.45,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.mainText, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.mainText, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.mainText, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ));
  }
}
