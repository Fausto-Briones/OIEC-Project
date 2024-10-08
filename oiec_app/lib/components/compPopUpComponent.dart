import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CompetenciaDialog extends StatelessWidget {
  final String competencia;
  final String lugar;
  final String fecha;
  final String modalidad;
  final String form;

  const CompetenciaDialog({
    required this.competencia,
    required this.lugar,
    required this.fecha,
    required this.modalidad,
    required this.form
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(competencia),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.access_time),
              const SizedBox(width: 8),
              Text(fecha),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on),
              const SizedBox(width: 8),
              Text(lugar),
            ],
          ),
          const SizedBox(height: 8),
          Text('Modalidad: $modalidad'),
          const SizedBox(height: 16),
          Text(
            'Te invitamos a participar de $competencia, se encuentran abiertas las inscripciones hasta el $fecha. Con sede en la ciudad de $lugar aunque la modalidad del concurso será $modalidad.',
          ),
          const SizedBox(height: 16),
          Text('Costo de inscripción: Gratis'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cerrar'),
        ),
        TextButton(
          onPressed: ()  {
            _launchURL(form);
          },
          child: const Text('Inscribirme'),
        ),
      ],
    );
  }
}

void _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw 'Could not launch $url';
  }
}