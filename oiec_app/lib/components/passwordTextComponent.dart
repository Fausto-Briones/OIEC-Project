import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final String hintText;
  final Color hintColor;
  final Color textColor;

  PasswordInputField({
    required this.labelText,
    required this.controller,
    this.hintText = '',
    this.hintColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          style: TextStyle(color: widget.textColor),
          controller: widget.controller,
          obscureText: _obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: widget.hintColor),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: widget.hintColor,
              ),
              onPressed: _toggleVisibility,
            ),
          ),
        ),
      ],
    );
  }
}