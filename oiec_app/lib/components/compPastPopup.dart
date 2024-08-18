import 'package:flutter/material.dart';

class CompetenciaPastDialog extends StatelessWidget {
  final String competencia;
  final String lugar;
  final String fecha;
  final String modalidad;


  const CompetenciaPastDialog({
    required this.competencia,
    required this.lugar,
    required this.fecha,
    required this.modalidad,
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
            'La competencia $competencia, fue realizada el dia $fecha. Con sede en la ciudad de $lugar , la modalidad del concurso fue $modalidad.',
          ),
          const SizedBox(height: 16),

        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cerrar'),
        ),
        
      ],
    );
  }
}