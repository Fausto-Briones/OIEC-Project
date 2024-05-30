import 'package:flutter/material.dart';

class DrawerOption extends StatelessWidget{
  final String name;
  const DrawerOption({super.key, required this.name});

  @override
  Widget build(BuildContext context){
    return(
      ListTile(
              leading: const Icon(Icons.settings),
              title: Text(name),
              onTap: () {
                //Pasar como parametro a esta clase la funcion de enrutamiento
                //TO DO: crear Router (se requieren mas pantallas creadas)
                Navigator.pop(context);
              })
    );
  }
}