import 'package:flutter/material.dart';
import 'package:oiec_app/components/drawerComponent.dart';
import 'package:oiec_app/utilities/colorsController.dart';

class MainLayout extends StatelessWidget{

  final String title;
  final Widget body;
  const MainLayout({super.key, required this.title, required this.body});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          leading: Tooltip(
          message: 'Open navigation menu',
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            }
            )
            ),
          title: Text(
            title, 
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.white
              )
            ),
            backgroundColor: HexColor('#141927'),
            iconTheme: const IconThemeData(
              color: Colors.white, // Set the AppBar icon color to white
            ),
        ),
        drawer: DrawerComponent(),
        backgroundColor: HexColor('#141927'),
        
        body: body,
    );
  }
}

