import 'package:flutter/material.dart';
import 'package:oiec_app/services/navigator.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/components/customContainer.dart';
import 'package:oiec_app/components/generalButtonComponent.dart';
import 'package:oiec_app/globals.dart';

class EntrenamientoScreen extends StatelessWidget {
  EntrenamientoScreen({super.key});
  final Enrouter router = Enrouter.instance;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Entrenamientos",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              CustomContainer(
                child: _EntrenamientoContent(
                  nombreActividad: 'Sesion 1',
                  tema: 'Punteros en C',
                ),
              ),
              CustomContainer(
                child: _EntrenamientoContent(
                  nombreActividad: 'Sesion 2',
                  tema: 'Bucles',
                ),
              ),
            ],
          ),
          if (isTrainer)...[
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.05),
              child: GeneralButton(
                text: 'Añadir recursos',
                onPressed: () {
                  router.navigateToNewFileScreen(context);
                },
              ),
            )
          ]
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
