import 'package:flutter/material.dart';

class InputFieldWithLabel extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String hintText;
  final Color hintColor;
  final Color textColor;

  InputFieldWithLabel({
    required this.labelText,
    required this.controller,
    this.hintText = '',
    this.hintColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          style: TextStyle(color: textColor),
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hintText,
            hintStyle: TextStyle(color: hintColor),
          ),
        ),
      ],
    );
  }
}
