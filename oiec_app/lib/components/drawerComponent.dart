import 'package:flutter/material.dart';
import 'package:oiec_app/components/drawerOptionsComponent.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:gradient_icon/gradient_icon.dart';

class DrawerComponent extends StatelessWidget{
  final String mainLogo = '../assets/customIcons/oiecLogo.svg';
  final String logoName = 'OIEC_logo';
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context){
    return(
      Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                children: [
                   SvgPicture.asset(
                    mainLogo
                    ,semanticsLabel: logoName
                    )
                  ,Text(
                'OIEC',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
                ],)
            ),
            DrawerOption(name:'Home',icon:Icon(Icons.home)),
            DrawerOption(name:'Entrenamiento',icon:Icon(Icons.group)),
            DrawerOption(name:'Pagos',icon:Icon(Icons.payments)),
            DrawerOption(name:"Competencias",icon:Icon(Icons.calendar_month)),
            DrawerOption(name:"Noticias", icon:Icon(Icons.newspaper)),
            DrawerOption(name:"Chat",icon:Icon(Icons.chat)),
            
          ],
        ),
      )
    );
  }
}