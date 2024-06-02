import 'package:flutter/material.dart';
import 'package:oiec_app/noticiasScreen.dart';
import 'package:oiec_app/screens/homeScreen.dart';
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
      home: const HomeScreen()
    );
  }
}



