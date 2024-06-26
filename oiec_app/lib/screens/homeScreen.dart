import 'dart:async';

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

class _News extends StatefulWidget{

    @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<_News> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      _autoScroll();
    });
  }

  void _autoScroll() {
    setState(() {
      _scrollPosition += 2.0; 
      if (_scrollPosition >= _scrollController.position.maxScrollExtent) {
        _scrollPosition = 0.0;
      }
      _scrollController.animateTo(
        _scrollPosition,
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Noticias",textAlign: TextAlign.left, style: TextStyle(color: Color(0xFF595085),fontSize: 24),),
         SizedBox(
          height: 100, 
          child: ListView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            children: [
                Newshomecomponent(
                  noticia:
                      "Resultados de la última competencia disponibles",
                ),
                Newshomecomponent(
                  noticia:
                      "Inscripciones abiertas",
                ),
                Newshomecomponent(
                  noticia:
                      "Fecha de premiación anunciada",
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