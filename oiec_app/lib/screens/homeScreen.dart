import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/components/compHomeComponent.dart';
import 'package:oiec_app/components/newsHomeComponent.dart';
import 'package:oiec_app/globals.dart' as globals;
import '../services/db_service.dart';


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
          _PreviousResults(),
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

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Noticias",textAlign: TextAlign.left, style: TextStyle(color: Color.fromARGB(255, 190, 184, 222),fontSize: 24),),
         SizedBox(
          height: 100, 
          child: ListView(
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


class _PreviousResults extends StatefulWidget{
  @override
  _PreviousResultsState createState() => _PreviousResultsState();
    
  }
  


class _PreviousResultsState extends State<_PreviousResults> {
  Future<Map<String,Map<String,dynamic>>>? futureResults;

  @override
  void initState() {
    super.initState();
    // Assuming you have a method to get the user's 'cedula'
    Future.delayed(Duration(seconds: 2), () {
      String cedula = globals.cedula;
      setState(() {
        futureResults = DatabaseService.fetchPastResults(cedula);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Tus resultados pasados",
          textAlign: TextAlign.left,
          style: TextStyle(color: Color.fromARGB(255, 190, 184, 222), fontSize: 24),
        ),
        SizedBox(
          height: 150,
          child: futureResults == null 
              ? const Center(child: CircularProgressIndicator()) // Show loading indicator if future is null
              : FutureBuilder<Map<String, Map<String, dynamic>>>(
        future: futureResults,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('No se pudieron cargar tus resultados'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay resultados previos disponibles.'));
          } else {
            Map<String, dynamic> results = snapshot.data!['results']!;

                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: results.entries.map((entry) {
                    // Accessing the key and value from the map entry
                    String contestId = entry.key;
                    Map<String, dynamic> resultData = entry.value;

                    return CompHomeComponent(
                      competencia: contestId, // Using the id as the competencia name
                      puntaje: resultData['score']?.toString() ?? 'N/A', // Accessing the score from the data
                    );
                  }).toList(),
                );
          }
        },
      ),
        ),
      ],
    );
  }
}