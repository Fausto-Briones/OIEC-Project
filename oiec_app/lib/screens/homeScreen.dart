import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/components/compHomeComponent.dart';
import 'package:oiec_app/components/customContainer.dart';
import 'package:oiec_app/components/newsHomeComponent.dart';


class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  MainLayout(
      title: "Home",
      body: _HomeContent() ,
  
    
    
    );
  }

  
}
class _HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          const SizedBox(height: 20),
          _News(),
          _PreviousContests(),
          _Chats(),
        ],
      ),
    );
  }
}

class _News extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Noticias",textAlign: TextAlign.left, style: TextStyle(color: Color(0xFF595085),fontSize: 24),),
         SizedBox(
          height: 100, 
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), // Adjust horizontal padding
                child: Newshomecomponent(
                  noticia:
                      "Ya se encuentran disponibles los resultados de la última competencia",
                ),
              ),

            ],
          ),
        ),
        
      ],
    );

  }
}


class _PreviousContests extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Competencias pasadas", textAlign: TextAlign.left,style: TextStyle(color: Color(0xFF595085),fontSize: 24),),
        Container(height: 120, child:  const Row(
          children:[
             Center(
        child: Text('No hay competencias pasadas.',style: TextStyle(color: Colors.white),)
      )
            ]
          
        ))
      ],
    );
  }
}



class _Chats extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Chats",textAlign: TextAlign.left, style: TextStyle(color: Color(0xFF595085),fontSize: 24),),
        Column(

        )
      ],
    );
  }
}