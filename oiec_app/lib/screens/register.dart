import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oiec_app/services/auth.dart';
import 'package:oiec_app/services/navigator.dart';
import 'package:oiec_app/utilities/colorsController.dart';
import 'package:oiec_app/components/inputTextComponent.dart';

class BirthdayField extends StatefulWidget {
  @override
  _BirthdayFieldState createState() => _BirthdayFieldState();
}

class _BirthdayFieldState extends State<BirthdayField> {
  TextEditingController _controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        _controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: "Selecciona tu fecha de nacimiento",
        hintStyle: TextStyle(color: Colors.white),
        labelStyle: TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () {
            _selectDate(context);
          },
        ),
        border: OutlineInputBorder(),
      ),
      readOnly: true,
      onTap: () {
        _selectDate(context);
      },
    );
  }
}

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
        padding: EdgeInsets.only(top: 110, left: 15.0, right: 15.0),
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
              thickness: 1,       // Espesor de la línea
            ),
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
          //BirthdayField(),
          InputFieldWithLabel(
            labelText: 'Fecha de nacimiento',
            controller: _controllerFecha,
            hintText: 'Ingresa tu fecha de nacimiento (dd/mm/aaaa)',
            hintColor: Colors.grey,
          ),
          SizedBox(height: 16), // Espacio entre los campos de entrada
          InputFieldWithLabel(
            labelText: 'Curso',
            controller: _controllerCurso,
            hintText: 'Ingresa tu curso actual',
            hintColor: Colors.grey,
          ),
          SizedBox(height: 16), // Espacio entre los campos de entrada
          InputFieldWithLabel(
            labelText: 'Correo',
            controller: _controllerCorreo,
            hintText: 'Ingresa tu correo',
            hintColor: Colors.grey,
          ),
          SizedBox(height: 16), // Espacio entre los campos de entrada
          InputFieldWithLabel(
            labelText: 'Contraseña',
            controller: _controllerContrasenia,
            hintText: 'Ingresa tu contraseña',
            hintColor: Colors.grey,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async{
              var result = await _auth.createAccount(_controllerCorreo.text, _controllerContrasenia.text);
              if(result == 1){
                //Contraseña debil
              }else if(result==2){
                //Correo usado
              }else if(result!=null){
                router.navigateToHomeScreen(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: HexColor('#21283F'), // Color de fondo del botón
              foregroundColor: Colors.white, // Color del texto
            ),
            child: Text('Registrarme'),
          ),
        ]),
      ),
    );
  }
}
