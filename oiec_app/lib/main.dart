import 'package:flutter/material.dart';
import 'package:oiec_app/screens/noticiasScreen.dart';
import 'package:oiec_app/screens/competenciasScreen.dart';
import 'package:oiec_app/screens/homeScreen.dart';
import 'package:oiec_app/screens/pagosScreen.dart';
import 'package:oiec_app/screens/login.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'OIECApp',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: const Login()
    );
  }
}



