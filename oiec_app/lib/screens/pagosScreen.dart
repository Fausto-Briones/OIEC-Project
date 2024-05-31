import 'package:flutter/material.dart';
import 'package:oiec_app/utilities/colorsController.dart';

class PagosScreen extends StatelessWidget {
  const PagosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pagos',
          style: TextStyle( 
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold ,
            )
        ),
        backgroundColor: HexColor('#141927'),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            height: 60.0,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Text("Inscripción ONI 2023"),
                Text("10/Oct/2023")
                ],
              ),
              Icon(
                Icons.picture_as_pdf,
              ),
            ],) 
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            color: Colors.white,
            height: 60.0,
            child: const Center(
              child: Text(
                "Inscripción ONI 2024"
                ),
            ),
          ),
        ],
      ),
      backgroundColor: HexColor('#141927'),
    );
  }
}