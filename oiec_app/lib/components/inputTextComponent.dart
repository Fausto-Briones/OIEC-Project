import 'package:flutter/material.dart';

class InputFieldWithLabel extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String hintText;
  final Color hintColor;
  final Color textColor;

  const InputFieldWithLabel({super.key, 
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
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: TextStyle(color: textColor),
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintText,
            hintStyle: TextStyle(color: hintColor),
          ),
        ),
      ],
    );
  }
}
