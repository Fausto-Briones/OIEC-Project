import 'package:flutter/material.dart';
import 'package:oiec_app/components/drawerOptionsComponent.dart';
class DrawerComponent extends StatelessWidget{
  
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context){
    return(
      Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'OIEC',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            DrawerOption(name:'Home'),
            DrawerOption(name:'Entrenamiento'),
            DrawerOption(name:'Pagos'),
            DrawerOption(name:"Competencias"),
            DrawerOption(name:"Noticias"),
            DrawerOption(name:"Chat"),
            
          ],
        ),
      )
    );
  }
}