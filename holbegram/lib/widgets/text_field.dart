import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final bool ispassword;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;

  const TextFieldInput({
     Key? key,
      required this.controller,
      required this.ispassword,
      required this.hintText,
      this.suffixIcon,
      required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: const Color.fromARGB(218, 226, 37, 24),
      obscureText: ispassword,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
          color : Colors.transparent,
          style:  BorderStyle.none,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
          color: Colors.transparent,
            style: BorderStyle.none,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
           borderSide: BorderSide(
            color: Colors.transparent,
            style: BorderStyle.none,
          ),
        ),
        filled : true,
        contentPadding : EdgeInsets.all(8),
      suffixIcon: suffixIcon,
    ),
    );
  }
}
