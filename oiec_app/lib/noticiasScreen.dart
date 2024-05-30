import 'package:flutter/material.dart';
import 'package:oiec_app/utilities/colorsController.dart';
import 'package:oiec_app/components/drawerComponent.dart';
class NoticiasScreen extends StatelessWidget{
  const NoticiasScreen({super.key});

  @override
  Widget build(BuildContext context){
    return(
      Scaffold(
        appBar: AppBar(
          title: const Text(
            'Noticias', 
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.white
              )
            )
        ),
        drawer: const DrawerComponent()
        ,backgroundColor: HexColor('#141927'),)
    );
  }
}