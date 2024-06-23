import 'package:flutter/material.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/components/compHomeComponent.dart';


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

    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Noticias",textAlign: TextAlign.left, style: TextStyle(color: Color(0xFF595085),fontSize: 24),),
        Row(

        )
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
        // ignore: sized_box_for_whitespace
        Container(height: 120, child:  const Row(
          children:[
             Expanded(child: CompHomeComponent(nroCompetencia: "1", premio: "Bronce", puntaje: "17"))
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