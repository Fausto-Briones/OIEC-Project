import 'package:flutter/material.dart';
import 'package:oiec_app/utilities/colorsController.dart';

class CompHomeComponent extends StatelessWidget{

  final String competencia;
  final String puntaje;

  const CompHomeComponent({super.key, required this.competencia, required this.puntaje});
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,), child:  
      InkWell(
      onTap: () {
        // Define your onTap action here
        print("Tapped on $competencia");
      },
      child: Container(

        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        width: screenWidth * 0.85, // Almost full width with some padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: const Color(0xFFF0F0F0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              competencia,
              style: const TextStyle(
                color: Color.fromARGB(255, 100, 100, 180),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(  
            children: [
            Text(
              "Puntaje obtenido:",
              style: TextStyle(
                color: HexColor('#141927'),
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0), // Bottom padding for spacing
              child: Text(
              puntaje,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
              ),
            ),
            ),
            
            ]
            ),
          ],
        ),
      ),
    ));
  }

}