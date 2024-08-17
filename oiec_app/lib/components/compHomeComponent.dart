import 'package:flutter/material.dart';


class CompHomeComponent extends StatelessWidget{

  final String competencia;
  final String puntaje;

  const CompHomeComponent({super.key, required this.competencia, required this.puntaje});
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0), child:  InkWell(
      onTap: () {
        // Define your onTap action here
        print("Tapped on $competencia");
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Puntaje obtenido:",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              puntaje,
              style: const TextStyle(
                color: Color.fromARGB(255, 150, 150, 150),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    ));
  }

}