import 'package:flutter/material.dart';

class AlertComponent extends StatelessWidget {
  final String title;
  final String content;

  const AlertComponent({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

void showCustomAlertDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertComponent(
        title: title,
        content: content,
      );
    },
  );
}
