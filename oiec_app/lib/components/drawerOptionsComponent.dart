// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DrawerOption extends StatelessWidget{
  final String name;
  final Icon icon;
  final void Function() onPressed;
  const DrawerOption({super.key, required this.name, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context){
    return(
      ListTile(
              leading: icon,
              title: Text(name, style: const TextStyle(fontFamily: 'Roboto')),
              onTap: () {
                onPressed();
              })
    );
  }
}