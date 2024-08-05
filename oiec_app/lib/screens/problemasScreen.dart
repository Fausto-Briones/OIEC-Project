import 'package:flutter/material.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/components/customContainer.dart';

class ProblemasScreen extends StatelessWidget {
  const ProblemasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(title: "Problemas Asignados", 
      body:  Column(
        children: [
          CustomContainer(
              child: _PagosContent(
                  evento: 'Inscripcion ONI 2023', fecha: '20/02/2023'
              )
          ),
          CustomContainer(
              child: _PagosContent(
                  evento: 'Inscripcion ONI 2024', fecha: '20/02/2024',
              )
          )
        ],
      ),
    );
  }
}

class _PagosContent extends StatelessWidget {
  final String evento;
  final String fecha;

  const _PagosContent({required this.evento, required this.fecha});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text(evento), Text(fecha)],
        ),
        const Icon(
          Icons.picture_as_pdf,
        ),
      ],
    );
  }
}
