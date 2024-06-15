import 'package:flutter/material.dart';
import 'package:oiec_app/components/drawerOptionsComponent.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:gradient_icon/gradient_icon.dart';
import 'package:oiec_app/services/navigator.dart';

class DrawerComponent extends StatelessWidget{
  final String mainLogo = '../assets/customIcons/oiecLogo.svg';
  final String logoName = 'OIEC_logo';
  DrawerComponent({super.key});

  final Enrouter router = Enrouter.instance;



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
            DrawerOption(name:'Home',icon:Icon(Icons.home),onPressed: router.navigateToHomeScreen(context),),
            DrawerOption(name:'Entrenamiento',icon:Icon(Icons.group),onPressed: router.navigateToEntrenamientosScreen(context)),
            DrawerOption(name:'Pagos',icon:Icon(Icons.payments), onPressed: router.navigateToPagosScreen(context),),
            DrawerOption(name:"Competencias",icon:Icon(Icons.calendar_month),onPressed: router.navigateToCompetenciasScreen(context),),
            DrawerOption(name:"Noticias", icon:Icon(Icons.newspaper),onPressed: router.navigateToNewScreen(context),),
            DrawerOption(name:"Chat",icon:Icon(Icons.chat),onPressed: router.navigateToHomeScreen(context)),
            
          ],
        ),
      )
    );
  }
}