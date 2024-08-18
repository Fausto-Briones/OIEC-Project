import 'package:flutter/material.dart';
import 'package:oiec_app/components/compPastPopUp.dart';

class CompetenciaPastComponent extends StatelessWidget {
  final String competencia;
  final String lugar;
  final String fecha;
  final String modalidad;


  const CompetenciaPastComponent({super.key, 
    required this.competencia,
    required this.lugar,
    required this.fecha,
    required this.modalidad,

  }); 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => CompetenciaPastDialog(
            competencia: competencia,
            lugar: lugar,
            fecha: fecha,
            modalidad: modalidad,
          ),
        );
      },
      child: Card(
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
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Lugar: $lugar'),
                  Text('Fecha: $fecha'),
                  Text('Modalidad: $modalidad'),
                ],
              ),
            ),
            const Icon(Icons.assignment),
          ],
        ),
      ),
    ));
  }
}