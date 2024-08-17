import 'package:flutter/material.dart';


class CompHomeComponent extends StatelessWidget{

  final String competencia;
  final String puntaje;

  const CompHomeComponent({super.key, required this.competencia, required this.puntaje});
  
  @override
  Widget build(BuildContext context){
    return InkWell(
        onTap:()=>{

        },
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white
        ),
        child: Column(
          children: [
            Text("$competencia", style: const TextStyle(color: Colors.black)),
            const SizedBox(height: 10),
            Row(
              children: [
                Text("Puntaje obtenido:", style: const TextStyle(color: Colors.black),),
                const SizedBox(width: 10),
                Text(puntaje, style: const TextStyle(color: Colors.black))
              ],
            )

          ],
        
        ),
    )
    );
  }

}