import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oiec_app/utilities/colorsController.dart';
import 'package:oiec_app/components/inputTextComponent.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#141927'),
      body: Column(
          children: [
              Image.asset('../assets/logochevere.png'),
              InputFieldWithLabel(
                labelText: 'Correo',
                controller: TextEditingController(),
                hintText: 'Ingresa tu correo',
                hintColor: Colors.grey,
              ),
              SizedBox(height: 16), // Espacio entre los campos de entrada
              InputFieldWithLabel(
                labelText: 'Contraseña',
                controller: TextEditingController(),
                hintText: 'Ingresa tu contraseña',
                hintColor: Colors.grey,
              ),
              SizedBox(height: 20),
              ElevatedButton(
            onPressed: () {
              // Acción a realizar cuando se presiona el botón
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: HexColor('#21283F'), // Color de fondo del botón
              foregroundColor: Colors.white, // Color del texto
            ),
            child: Text('Iniciar Sesión'),
          ),
          ]
      ),
    );
  }
}