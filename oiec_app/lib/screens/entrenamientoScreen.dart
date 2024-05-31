import 'package:flutter/material.dart';
import 'package:oiec_app/utilities/colorsController.dart';

class EntrenamientoScreen extends StatelessWidget {
  const EntrenamientoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Entrenamiento',
          style: TextStyle( 
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold ,
            )
        ),
        centerTitle: true,
        backgroundColor: HexColor('#141927'),
      ),
      drawer: const Drawer(backgroundColor: Colors.white),
      body: const Column(
        children:[
          CustomContainer(nombreActividad: 'Sesión 1',tema: 'Punteros en C',),
          CustomContainer(nombreActividad: 'Sesión 2',tema: 'Bluces',),
          CustomContainer(nombreActividad: 'Sesión 3',tema: 'Condicionales',),
        ],
      ),
      backgroundColor: HexColor('#141927'),
    );
  }
}

class CustomContainer extends StatelessWidget {

  final String nombreActividad;
  final String tema;

  const CustomContainer({
    super.key,
    required this.nombreActividad,
    required this.tema,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text(nombreActividad) ,
          Text(tema)
          ],
        ),
        const Icon(
          Icons.play_circle,
        ),
        const Icon(
          Icons.picture_as_pdf,
        ),
      ],) 
    );
  }
}