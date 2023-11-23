import 'package:flutter/material.dart';

class FieldInput extends StatelessWidget {
  String? inputType;
  String? hintType;
  bool? inputShow;

  FieldInput(
      {required this.inputType,
      required this.hintType,
      required this.inputShow,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: inputType == "pass" ?TextInputType.text :TextInputType.emailAddress ,
        obscureText: inputShow as bool,
        decoration: InputDecoration(
          hintText: hintType,

          enabledBorder: OutlineInputBorder(
            borderSide: Divider.createBorderSide(context),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          // fillColor: Colors.red,
          filled: true,
          contentPadding: const EdgeInsets.all(8),
        ));
  }
}
