import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GeneralButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10), // Padding lateral del 10%
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8, // Ocupa el 80% del ancho
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15), // Ajusta el padding vertical según sea necesario
            backgroundColor: Colors.black, // Cambia el color del botón si es necesario
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}