import 'package:flutter/material.dart';
import 'package:oiec_app/screens/chatScreen.dart';
import 'package:oiec_app/screens/competenciasScreen.dart';
import 'package:oiec_app/screens/homeScreen.dart';
import 'package:oiec_app/screens/entrenamientoScreen.dart';
import 'package:oiec_app/screens/pagosScreen.dart';
import 'package:oiec_app/screens/noticiasScreen.dart';
import 'package:oiec_app/screens/chatDetailScreen.dart';
import 'package:oiec_app/screens/register.dart';

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

  void navigateToChatScreen(BuildContext context){
    Navigator.push(
      context, MaterialPageRoute(builder: (context)=> ChatScreen())
    );
  }

  void navigateToChatDetailScreen(BuildContext context){
    Navigator.push(
      context, MaterialPageRoute(builder: (context)=> ChatDetailScreen())
    );
  }

  void navigateToRegisterScreen(BuildContext context){
    Navigator.push(
      context, MaterialPageRoute(builder: (context)=>  Register())
    );
  }
}