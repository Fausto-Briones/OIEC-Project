import 'package:flutter/material.dart';
import 'package:oiec_app/utilities/colorsController.dart';
import 'package:oiec_app/components/customContainer.dart';

class EntrenamientoScreen extends StatelessWidget {
  const EntrenamientoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrenamiento',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor: HexColor('#141927'),
      ),
      drawer: const Drawer(backgroundColor: Colors.white),
      body: const Column(
        children: [
          CustomContainer(
              child: _EntrenamientoContent(
                  nombreActividad: 'Sesion 1', tema: 'Punteros en C')),
          CustomContainer(
              child: _EntrenamientoContent(
                  nombreActividad: 'Sesion 2', tema: 'Bucles'))
        ],
      ),
      backgroundColor: HexColor('#141927'),
    );
  }
}

class _EntrenamientoContent extends StatelessWidget {
  final String nombreActividad;
  final String tema;
  const _EntrenamientoContent(
      {required this.nombreActividad, required this.tema});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text(nombreActividad), Text(tema)],
        ),
        const Icon(
          Icons.play_circle,
        ),
        const Icon(
          Icons.picture_as_pdf,
        ),
      ],
    );
  }
}
