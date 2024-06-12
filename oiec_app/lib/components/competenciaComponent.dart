import 'package:flutter/material.dart';

class CompetenciaComponent extends StatelessWidget {
  final String competencia;
  final String lugar;
  final String fecha;
  final String modalidad;

  const CompetenciaComponent({
    required this.competencia,
    required this.lugar,
    required this.fecha,
    required this.modalidad,
  }); 

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    competencia,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Lugar: $lugar'),
                  Text('Fecha: $fecha'),
                  Text('Modalidad: $modalidad'),
                ],
              ),
            ),
            Icon(Icons.assignment),
          ],
        ),
      ),
    );
  }
}