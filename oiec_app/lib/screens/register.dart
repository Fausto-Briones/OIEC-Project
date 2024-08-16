import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
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

  final TextEditingController _controllerNombreCompleto = TextEditingController();
  final TextEditingController _controllerCedula = TextEditingController();
  final TextEditingController _controllerFecha = TextEditingController();
  final TextEditingController _controllerCurso = TextEditingController();
  final TextEditingController _controllerCorreo = TextEditingController();
  final TextEditingController _controllerContrasenia = TextEditingController();

  final RegExp _nombreCompletoExp = RegExp(r'^[a-zA-Z\s]+$');
  final RegExp _cedulaExp = RegExp(r'^\d{10}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#141927'),
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 15.0, right: 15.0),
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
                    labelText: 'Nombres *',
                    controller: _controllerNombreCompleto,
                    hintText: 'Ingresa tus nombres y apellidos',
                    hintColor: Colors.grey,
                  ),
                  const SizedBox(height: 16), // Espacio entre los campos de entrada
                  InputFieldWithLabel(
                    labelText: 'Cédula *',
                    controller: _controllerCedula,
                    hintText: 'Ingresa tu número de cédula',
                    hintColor: Colors.grey,
                  ),
                  const SizedBox(height: 16), // Espacio entre los campos de entrada
                  DatePickerWithLabel(
                    labelText: 'Fecha de Nacimiento *',
                    controller: _controllerFecha,
                    hintText: 'Seleccione su fecha de nacimiento',
                    hintColor: Colors.grey,
                    textColor: Colors.white,
                  ),
                  const SizedBox(height: 16), // Espacio entre los campos de entrada
                  DropdownWithLabel(
                    labelText: 'Curso actual *',
                    controller: _controllerCurso,
                    options: const ["Primero bachillerato", "Segundo bachillerato", "Tercero bachillerato"],
                    hintText: 'Seleccione una opción',
                    hintColor: Colors.grey,
                    textColor: Colors.white,
                  ),
                  const SizedBox(height: 16), // Espacio entre los campos de entrada
                  InputFieldWithLabel(
                    labelText: 'Correo *',
                    controller: _controllerCorreo,
                    hintText: 'Ingresa tu correo',
                    hintColor: Colors.grey,
                  ),
                  const SizedBox(height: 16), // Espacio entre los campos de entrada
                  PasswordInputField(
                    labelText: 'Contraseña *',
                    controller: _controllerContrasenia,
                    hintText: 'Ingresa tu contraseña',
                    hintColor: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: ElevatedButton(
              onPressed: () async {

                var nombreCompleto = _controllerNombreCompleto.text;
                var cedula = _controllerCedula.text;
                var correo = _controllerCorreo.text;
                var contrasena = _controllerContrasenia.text;
                var curso = _controllerCurso.text;
                var fechaN = _controllerFecha.text;

                if(!_nombreCompletoExp.hasMatch(nombreCompleto)){
                  showCustomAlertDialog(context, "Error", "El nombre debe contener sólo letras.");
                }else if(!_cedulaExp.hasMatch(cedula)){
                  showCustomAlertDialog(context, "Error", "La cédula debe tener sólo 10 dígitos.");
                } else if(!EmailValidator.validate(_controllerCorreo.text)){ 
                  // ignore: use_build_context_synchronously
                  showCustomAlertDialog(context, "Error", "Correo no válido");
                } else if(nombreCompleto.isEmpty || cedula.isEmpty || correo.isEmpty || contrasena.isEmpty || curso.isEmpty || fechaN.isEmpty){
                  // ignore: use_build_context_synchronously
                  showCustomAlertDialog(context, "Error", "Todos los campos son obligatorios.");
                }else{
                  var result = await _auth.createAccount(correo, contrasena);
                  if (result != null) {
                  // ignore: use_build_context_synchronously
                  _auth.agregarUsuario(nombreCompleto, cedula, fechaN, curso, correo);
                  router.navigateToHomeScreen(context);
                }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    HexColor('#21283F'), // Color de fondo del botón
                foregroundColor: Colors.white, // Color del texto
              ),
              child: const Text('Registrarme'),
            ),
          )
        ]),
      ),
    );
  }
}
