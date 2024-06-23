import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oiec_app/components/alertComponent.dart';
import 'package:oiec_app/components/coursePickerComponent.dart';
import 'package:oiec_app/components/datePickerComponent.dart';
import 'package:oiec_app/services/auth.dart';
import 'package:oiec_app/services/navigator.dart';
import 'package:oiec_app/utilities/colorsController.dart';
import 'package:oiec_app/components/inputTextComponent.dart';
import 'package:oiec_app/components/passwordTextComponent.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final AuthService _auth = AuthService();
  final Enrouter router = Enrouter.instance;

  TextEditingController _controllerNombre = TextEditingController();
  TextEditingController _controllerApellido = TextEditingController();
  TextEditingController _controllerFecha = TextEditingController();
  TextEditingController _controllerCurso = TextEditingController();
  TextEditingController _controllerCorreo = TextEditingController();
  TextEditingController _controllerContrasenia = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#141927'),
      body: Padding(
        padding: EdgeInsets.only(top: 100, left: 15.0, right: 15.0),
        child: Column(children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Registro",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          const Divider(
            color: Colors.white, // Color de la línea
            thickness: 1, // Espesor de la línea
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InputFieldWithLabel(
                    labelText: 'Nombres',
                    controller: _controllerNombre,
                    hintText: 'Ingresa tus nombres',
                    hintColor: Colors.grey,
                  ),
                  SizedBox(height: 16), // Espacio entre los campos de entrada
                  InputFieldWithLabel(
                    labelText: 'Apellidos',
                    controller: _controllerApellido,
                    hintText: 'Ingresa tus apellidos',
                    hintColor: Colors.grey,
                  ),
                  SizedBox(height: 16), // Espacio entre los campos de entrada
                  DatePickerWithLabel(
                    labelText: 'Fecha de Nacimiento',
                    controller: _controllerFecha,
                    hintText: 'Seleccione su fecha de nacimiento',
                    hintColor: Colors.grey,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 16), // Espacio entre los campos de entrada
                  DropdownWithLabel(
                    labelText: 'Seleccionar opción',
                    controller: _controllerCurso,
                    options: ["Primero bachillerato", "Segundo bachillerato", "Tercero bachillerato"],
                    hintText: 'Seleccione una opción',
                    hintColor: Colors.grey,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 16), // Espacio entre los campos de entrada
                  InputFieldWithLabel(
                    labelText: 'Correo',
                    controller: _controllerCorreo,
                    hintText: 'Ingresa tu correo',
                    hintColor: Colors.grey,
                  ),
                  SizedBox(height: 16), // Espacio entre los campos de entrada
                  PasswordInputField(
                    labelText: 'Contraseña',
                    controller: _controllerContrasenia,
                    hintText: 'Ingresa tu contraseña',
                    hintColor: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: ElevatedButton(
              onPressed: () async {
                var result = await _auth.createAccount(
                    _controllerCorreo.text, _controllerContrasenia.text);
                
                if(!EmailValidator.validate(_controllerCorreo.text)){ 
                  showCustomAlertDialog(context, "Error", "Correo no válido");
                }else if (_controllerContrasenia.text.isEmpty || _controllerCorreo.text.isEmpty){
                  showCustomAlertDialog(context, "Error", "El correo o contraseña no es válido.");
                } else if (result != null) {
                  router.navigateToHomeScreen(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    HexColor('#21283F'), // Color de fondo del botón
                foregroundColor: Colors.white, // Color del texto
              ),
              child: Text('Registrarme'),
            ),
          )
        ]),
      ),
    );
  }
}
