import 'package:flutter/material.dart';
import 'package:oiec_app/services/navigator.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/components/customContainer.dart';
import 'package:oiec_app/components/generalButtonComponent.dart';
import 'package:oiec_app/globals.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class EntrenamientoScreen extends StatefulWidget {
  const EntrenamientoScreen({super.key});

  @override
  _EntrenamientoscreenState createState() => _EntrenamientoscreenState();
}

class _EntrenamientoscreenState extends State<EntrenamientoScreen> {
  final Enrouter router = Enrouter.instance;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Entrenamientos",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FutureBuilder<Map<String, Map<String, dynamic>>>(
            future: DatabaseService.fetchTrainings(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show a loading indicator while the data is being fetched
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // Handle errors
                return const Center(child: Text('Failed to load trainings.'));
              } else if (snapshot.hasData) {
                // Once data is loaded, display the tabs with contests
                final entrenamientos = snapshot.data!['entrenamientos']!;

                return _Entrenamientos(entrenamientos);
              } else {
                // Handle the case where snapshot has no data
                return const Center(
                    child: Text('No hay entrenamientos disponibles.'));
              }
            },
          ),
          if (isTrainer) ...[
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

class DatabaseService {
  static final String baseUrl =
      'https://dereck.pythonanywhere.com/api'; // Replace with your IP address

  static Future<Map<String, Map<String, dynamic>>> fetchTrainings() async {
    final response = await http.get(Uri.parse('$baseUrl/trainings'));

    if (response.statusCode == 200) {
      Map<String, dynamic> entrenamientos = jsonDecode(response.body);

      return {
        'entrenamientos': entrenamientos,
      };
    } else {
      throw Exception('Failed to load trainings');
    }
  }
}

class _Entrenamientos extends StatelessWidget {
  final Map<String, dynamic> entrenamientos;

  _Entrenamientos(this.entrenamientos);

  @override
  Widget build(BuildContext context) {
    return entrenamientos.isEmpty
        ? const Center(
            child: Text(
              'No hay entrenamientos disponibles.',
              style: TextStyle(color: Colors.white),
            ),
          )
        : Column(
            children: entrenamientos.values.map((entrenamiento) {
              return CustomContainer(
                child: _EntrenamientoContent(
                  nombreActividad: entrenamiento['name'] ?? 'Unnamed Training',
                  fecha: DateFormat.yMMMMd()
                      .format(DateTime.parse(entrenamiento['date'])),
                  entrenador: entrenamiento['trainer'] ?? 'None',
                  video: entrenamiento['video'],
                  archivo: entrenamiento['files'],
                ),
              );
            }).toList(),
          );
  }
}

class _EntrenamientoContent extends StatelessWidget {
  final String nombreActividad;
  final String fecha;
  final String entrenador;
  final String video;
  final String archivo;

  const _EntrenamientoContent({
    required this.nombreActividad,
    required this.fecha,
    required this.entrenador,
    required this.video,
    required this.archivo,
  });

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir la URL: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(nombreActividad),
            Text(fecha),
            Text(entrenador),
          ],
        ),
        GestureDetector(
          onTap: () => _launchURL(video),
          child: Icon(
            Icons.play_circle,
            size: 30, // Tamaño del ícono
            color: Colors.black, // Color del ícono
          ),
        ),
        GestureDetector(
          onTap: () => _launchURL(archivo),
          child: Icon(
            Icons.picture_as_pdf,
            size: 30, // Tamaño del ícono
            color: Colors.black, // Color del ícono
          ),
        ),
      ],
    );
  }
}
