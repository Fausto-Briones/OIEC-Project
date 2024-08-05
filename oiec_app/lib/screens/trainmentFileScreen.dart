import 'package:flutter/material.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/components/generalButtonComponent.dart';
import 'package:oiec_app/components/inputTextComponent.dart';
import 'package:oiec_app/services/navigator.dart';

class TrainmentFileScreen extends StatelessWidget {
  TrainmentFileScreen({super.key});

  final TextEditingController _controllerTitulo = TextEditingController();
  final TextEditingController _controllerEnlace = TextEditingController();

  final Enrouter router = Enrouter.instance;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Nuevo recurso",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              InputFieldWithLabel(
                labelText: 'Título de la clase',
                controller: _controllerTitulo,
                hintText: '',
                hintColor: Colors.grey,
              ),
              InputFieldWithLabel(
                labelText: 'Enlace de la clase',
                controller: _controllerEnlace,
                hintText: '',
                hintColor: Colors.grey,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.05),
            child: GeneralButton(
              text: 'Agregar',
              onPressed: () {
                router.navigateToEntrenamientosScreen(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
