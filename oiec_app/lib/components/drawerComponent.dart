import 'package:flutter/material.dart';
import 'package:oiec_app/components/drawerOptionsComponent.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:gradient_icon/gradient_icon.dart';
import 'package:oiec_app/services/navigator.dart';

class DrawerComponent extends StatelessWidget{
  final String mainLogo = 'assets/customIcons/oiecLogo.svg';
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
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                children: [
                   SvgPicture.asset(
                    mainLogo
                    ,semanticsLabel: logoName
                    )
                  ,const Text(
                'OIEC',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
                ],)
            ),
            DrawerOption(name:'Home',icon:const Icon(Icons.home),onPressed: (){
              router.navigateToHomeScreen(context);
              }),
            DrawerOption(name:'Entrenamiento',icon:const Icon(Icons.group),onPressed: (){
              router.navigateToEntrenamientosScreen(context);
              }),
            DrawerOption(name:'Pagos',icon:const Icon(Icons.payments), onPressed: (){
              router.navigateToPagosScreen(context);
              }),
            DrawerOption(name:"Competencias",icon:const Icon(Icons.calendar_month),onPressed: (){
              router.navigateToCompetenciasScreen(context);
              }),
            DrawerOption(name:"Noticias", icon:const Icon(Icons.newspaper),onPressed: (){
              router.navigateToNewScreen(context);
              }),
            DrawerOption(name:"Chat",icon:const Icon(Icons.chat),onPressed: (){
              router.navigateToChatScreen(context);
              }),
            
          ],
        ),
      )
    );
  }
}