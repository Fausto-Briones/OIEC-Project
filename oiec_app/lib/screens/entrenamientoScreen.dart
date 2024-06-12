import 'package:flutter/material.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/components/customContainer.dart';

class EntrenamientoScreen extends StatelessWidget {
  const EntrenamientoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(title: "Entrenamientos", 
      body: Column(
        children: [
          CustomContainer(
              child: _EntrenamientoContent(
                  nombreActividad: 'Sesion 1', tema: 'Punteros en C')),
          CustomContainer(
              child: _EntrenamientoContent(
                  nombreActividad: 'Sesion 2', tema: 'Bucles'))
        ],
      ),
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
