import 'package:flutter/material.dart';

class DrawerOption extends StatelessWidget{
  final String name;
  final Icon icon;
  const DrawerOption({super.key, required this.name, required this.icon});

  @override
  Widget build(BuildContext context){
    return(
      ListTile(
              leading: icon,
              title: Text(name, style: const TextStyle(fontFamily: 'Roboto')),
              onTap: () {
                //Pasar como parametro a esta clase la funcion de enrutamiento
                //TO DO: crear Router (se requieren mas pantallas creadas)
                Navigator.pop(context);
              })
    );
  }
}