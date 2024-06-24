import 'package:flutter/material.dart';

class Newshomecomponent extends StatelessWidget {
  final String noticia;


  const Newshomecomponent({super.key, 
    required this.noticia,
  }); 

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
             Text(noticia)
          ],
        ),
      ),
    );
  }
}