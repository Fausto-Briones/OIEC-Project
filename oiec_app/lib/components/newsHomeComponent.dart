import 'package:flutter/material.dart';

class Newshomecomponent extends StatelessWidget {
  final String noticia;


  const Newshomecomponent({super.key, 
    required this.noticia,
  }); 

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), child: SizedBox( 
      width: 200,
      child: Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              noticia, 
              maxLines: 4,  
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center
              )
          ],
        ),
      ),
    )));
  }
}