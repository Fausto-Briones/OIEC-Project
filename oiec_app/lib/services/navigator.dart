import 'package:flutter/material.dart';
import 'package:oiec_app/screens/competenciasScreen.dart';
import 'package:oiec_app/screens/homeScreen.dart';
import 'package:oiec_app/screens/entrenamientoScreen.dart';
import 'package:oiec_app/screens/pagosScreen.dart';
import 'package:oiec_app/screens/noticiasScreen.dart';


class Enrouter{
  Enrouter._privateConstructor();
  static final Enrouter instance = Enrouter._privateConstructor();

  void navigateToHomeScreen(BuildContext context){
    Navigator.push(
      context, MaterialPageRoute(builder: (context)=> const HomeScreen())
    );
  }

  void navigateToCompetenciasScreen(BuildContext context){
    Navigator.push(
      context, MaterialPageRoute(builder: (context)=> const CompetenciasScreen())
    );
  }

  void navigateToEntrenamientosScreen(BuildContext context){
    Navigator.push(
      context, MaterialPageRoute(builder: (context)=> const EntrenamientoScreen())
    );
  }

  void navigateToPagosScreen(BuildContext context){
    Navigator.push(
      context, MaterialPageRoute(builder: (context)=> const PagosScreen())
    );
  }

  void navigateToNewScreen(BuildContext context){
    Navigator.push(
      context, MaterialPageRoute(builder: (context)=> const NoticiasScreen())
    );
  }

}