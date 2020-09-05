import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final TextInputType inputType;
  final String label;
  final bool isPassword;

  const InputFieldWidget({Key key, this.inputType, this.label, this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: inputType,
          obscureText: isPassword ?? false,
          decoration: InputDecoration(
            hintText: label,
            filled: true,
            fillColor: Colors.white,
            labelStyle: TextStyle(color: Color(0xFF6B8F71)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
