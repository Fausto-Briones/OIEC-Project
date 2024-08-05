import 'package:flutter/material.dart';
import 'package:oiec_app/components/drawerOptionsComponent.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oiec_app/services/navigator.dart';
import 'package:oiec_app/globals.dart';

class DrawerComponent extends StatelessWidget {
  final String mainLogo = 'assets/customIcons/oiecLogo.svg';
  final String logoName = 'OIEC_logo';
  DrawerComponent({super.key});

  final Enrouter router = Enrouter.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF3B3B58), 
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 55, 55, 116), // Same as the drawer background color
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    mainLogo,
                    semanticsLabel: logoName,
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'OIEC',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            DrawerOption(
              name: 'Home',
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                router.navigateToHomeScreen(context);
              },
            ),
            DrawerOption( 
              name: 'Entrenamiento',
              icon: Icon(Icons.group, color: Colors.white),
              onPressed: () {
                router.navigateToEntrenamientosScreen(context);
              },
            ),
            DrawerOption(
              name: isTrainer ? 'Problemas' : 'Pagos',
              icon: Icon(
                isTrainer ? Icons.notes : Icons.payments,
                color: Colors.white,
              ),
              onPressed: () {
                if(isTrainer){
                  router.navigateToProblemasScreen(context);
                }else{
                  router.navigateToPagosScreen(context);
                }
              },
            ),
            DrawerOption(
              name: 'Competencias',
              icon: Icon(Icons.calendar_month, color: Colors.white),
              onPressed: () {
                router.navigateToCompetenciasScreen(context);
              },
            ),
            DrawerOption(
              name: 'Noticias',
              icon: Icon(Icons.newspaper, color: Colors.white),
              onPressed: () {
                router.navigateToNewScreen(context);
              },
            ),
            DrawerOption(
              name: 'Chat',
              icon: Icon(Icons.chat, color: Colors.white),
              onPressed: () {
                router.navigateToChatScreen(context);
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              title: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              leading: Icon(Icons.logout, color: Colors.white),
              onTap: () {
                // Add your logout function here
              },
            ),
          ],
        ),
      ),
    );
  }
}
