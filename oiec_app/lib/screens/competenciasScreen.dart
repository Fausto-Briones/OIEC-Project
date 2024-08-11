import 'package:flutter/material.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/components/competenciaComponent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';




DateTime today = DateTime.now();
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

  
  List<dynamic> pastContests=[];
  List<dynamic> futureContests=[];

  Future fetchContests() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/contests'));
      
  if (response.statusCode == 200) {
    List<dynamic> contests= jsonDecode(response.body);
    contests.forEach((item){
      print(item);
        DateTime contestDate = DateTime.parse(item['date']);
        if (contestDate.isBefore(today)) {
          pastContests.add(item);
        } else {
          futureContests.add(item);
        }
      });
    // Process the data as needed
  } else {
    // Handle the error
    print('Failed to load data');
  }
  }

 
  @override
  Widget build(BuildContext context) {
    fetchContests();
    return  Column(
      children: [
        const TabBar(tabs: [Tab(text: 'Futuras'),
            Tab(text: 'Pasadas')],
        ),
        Expanded(
          child: TabBarView(
            children: [
              _Futuras(futureContests),_Pasadas(pastContests)
            ],
          ),
        ),


      ] ,
  
    
    
    );
  }

}

class _Futuras extends StatelessWidget{
  List<dynamic> futureContests;
  
  _Futuras(this.futureContests);

  @override
  Widget build(BuildContext context) {
    return futureContests.isEmpty ?
    const Center(
        child: Text('No hay competencias futuras disponibles.',style: TextStyle(color: Colors.white),)
      )
     :Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: futureContests.length,
                  itemBuilder: (context, index){
                    var futureContest = futureContests[index];
                    return CompetenciaComponent(
                      competencia: futureContest['name'] ?? 'Unnamed Contest',
                      lugar: futureContest['location'] ?? 'Unknown Location',
                      fecha: DateFormat.yMMMMd().format(DateTime.parse(futureContest['date'])),
                      modalidad: futureContest['mode'] ?? 'Unknown Mode',
                );
                  }
                ),
              );
  }

}

class _Pasadas extends StatelessWidget{
  List<dynamic> pastContests=[];
  _Pasadas(this.pastContests);


  @override
    Widget build(BuildContext context) {
      return pastContests.isEmpty ?
    const Center(
        child: Text('No hay competencias pasadas disponibles.',style: TextStyle(color: Colors.white),)
      )
     :Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: pastContests.length,
                  itemBuilder: (context, index){
                    var futureContest = pastContests[index];
                    return CompetenciaComponent(
                      competencia: futureContest['name'] ?? 'Unnamed Contest',
                      lugar: futureContest['location'] ?? 'Unknown Location',
                      fecha: DateFormat.yMMMMd().format(DateTime.parse(futureContest['date'])),
                      modalidad: futureContest['mode'] ?? 'Unknown Mode',
                );
                  }
                ),
              );
  }


}


