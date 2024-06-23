import 'package:flutter/material.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/components/competenciaComponent.dart';


class CompetenciasScreen extends StatelessWidget{
  const CompetenciasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  MainLayout(
      title: "Competencias",
      body: DefaultTabController(
        length: 2,
        child: _CompetenciasContent(),

      ) ,
  
    
    
    );
  }

  
}

class _CompetenciasContent extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const TabBar(tabs: [Tab(text: 'Futuras'),
            Tab(text: 'Pasadas')],
        ),
        Expanded(
          child: TabBarView(
            children: [
              _Futuras(),_Pasadas()
            ],
          ),
        ),


      ] ,
  
    
    
    );
  }

}

class _Futuras extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: const [
                    CompetenciaComponent(
                      competencia: 'Competencia 0',
                      lugar: 'Quito',
                      fecha: '8/Sep/2023',
                      modalidad: 'Presencial',
                    ),
                  ],
                ),
              );
  }

}

class _Pasadas extends StatelessWidget{

  @override
    Widget build(BuildContext context) {
      return const Center(
        child: Text('No hay competencias pasadas.',style: TextStyle(color: Colors.white),)
      );
    }


}
