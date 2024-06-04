import 'package:flutter/material.dart';
import 'package:oiec_app/utilities/colorsController.dart';
import 'package:oiec_app/components/customContainer.dart';

class PagosScreen extends StatelessWidget {
  const PagosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagos',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: HexColor('#141927'),
      ),
      body: const Column(
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
      backgroundColor: HexColor('#141927'),
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
