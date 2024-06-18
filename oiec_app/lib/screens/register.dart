import 'package:flutter/material.dart';
import 'package:oiec_app/utilities/colorsController.dart';
import 'package:oiec_app/components/inputTextComponent.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#141927'),
      body: Column(
          children: [
              InputFieldWithLabel(
                labelText: 'Nombres',
                controller: TextEditingController(),
                hintText: 'Ingresa tus nombres',
                hintColor: Colors.grey,
              ),
              SizedBox(height: 16), // Espacio entre los campos de entrada
              InputFieldWithLabel(
                labelText: 'Apellidos',
                controller: TextEditingController(),
                hintText: 'Ingresa tus apellidos',
                hintColor: Colors.grey,
              ),
              SizedBox(height: 16), // Espacio entre los campos de entrada
              InputFieldWithLabel(
                labelText: 'fecha de nacimiento',
                controller: TextEditingController(),
                hintText: 'Ingresa tu fecha de nacimiento (dd/mm/aaaa)',
                hintColor: Colors.grey,
              ),
              SizedBox(height: 16), // Espacio entre los campos de entrada
              InputFieldWithLabel(
                labelText: 'Curso',
                controller: TextEditingController(),
                hintText: 'Ingresa tu curso actual',
                hintColor: Colors.grey,
              ),
              SizedBox(height: 16), // Espacio entre los campos de entrada
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
            child: Text('Registrarme'),
          ),
          ]
      ),
    );
  }
}