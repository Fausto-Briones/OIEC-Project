import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/components/alertComponent.dart';
import 'package:oiec_app/components/generalButtonComponent.dart';
import 'package:oiec_app/components/inputTextComponent.dart';
import 'package:oiec_app/services/navigator.dart';
import 'package:oiec_app/globals.dart';

class TrainmentFileScreen extends StatelessWidget {
  TrainmentFileScreen({super.key});

  final TextEditingController _controllerTitulo = TextEditingController();
  final TextEditingController _controllerTaller = TextEditingController();
  final TextEditingController _controllerEnlaceVideo = TextEditingController();
  final TextEditingController _controllerEnlaceArchivos = TextEditingController();

  final Enrouter router = Enrouter.instance;

  void agregarClase(String tituloTaller, String name, String video, String archivo) async {
    CollectionReference user =
        FirebaseFirestore.instance.collection('Trainings');

    user.doc(tituloTaller).set({
      'name': name,
      'Team': "",
      'trainer': cedula,
      'date': Timestamp.now(),
      'video': video,
      'files': archivo
    });
  }

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
                labelText: 'Título del taller',
                controller: _controllerTaller,
                hintText: 'Ingresa título del taller o competencia',
                hintColor: Colors.grey,
              ),
              const SizedBox(height: 30),
              InputFieldWithLabel(
                labelText: 'Tema de la clase',
                controller: _controllerTitulo,
                hintText: 'Ingresa tema de la clase',
                hintColor: Colors.grey,
              ),
              const SizedBox(height: 30),
              InputFieldWithLabel(
                labelText: 'Enlace de la clase',
                controller: _controllerEnlaceVideo,
                hintText: 'Ingresa enlace de video de la clase',
                hintColor: Colors.grey,
              ),
              const SizedBox(height: 30),
              InputFieldWithLabel(
                labelText: 'Enlace de archivos',
                controller: _controllerEnlaceArchivos,
                hintText: 'Ingresa enlace de archivos utilizados',
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
                var taller = _controllerTaller.text;
                var clase = _controllerTitulo.text;
                var video = _controllerEnlaceVideo.text;
                var archivo = _controllerEnlaceArchivos.text;
                if (taller.isEmpty || clase.isEmpty || video.isEmpty || archivo.isEmpty) {
                  // ignore: use_build_context_synchronously
                  showCustomAlertDialog(
                      context, "Error", "Todos los campos son obligatorios.");
                } else {
                  agregarClase(taller, clase, video, archivo);
                  Future.delayed(Duration(seconds: 1), () {
                    router.navigateToEntrenamientosScreen(context);
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
