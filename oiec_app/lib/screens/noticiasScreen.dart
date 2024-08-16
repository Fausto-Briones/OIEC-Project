import 'package:flutter/material.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/utilities/colorsController.dart';
import 'package:oiec_app/components/drawerComponent.dart';
import 'package:oiec_app/services/db_service.dart';
import 'package:oiec_app/components/newComponent.dart';

class NoticiasScreen extends StatefulWidget{
  const NoticiasScreen({super.key});

  @override
  _NoticiasScreenState createState() => _NoticiasScreenState();

}
  class _NoticiasScreenState extends State<NoticiasScreen>{
    late Future<Map<String,Map<String,dynamic>>> futureNews;
    @override
    void initState() {
      super.initState();
      futureNews = DatabaseService.fetchNews();
    }
    @override
    Widget build(BuildContext context) {
      return MainLayout(title: "Noticias", 
      body: FutureBuilder<Map<String,Map<String,dynamic>>>(
        future: futureNews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('No se pudo cargar las noticias'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay noticias disponibles.'));
          } else {
            return ListView(
              children: snapshot.data!['news']!.values.map((futureNew) {
                return Noticias(
                  newTitle: futureNew['title'] ?? 'Unnamed New',
                  newBrief: futureNew['message'] ?? 'Unknown Message',
                  newPicture: futureNew['image_url'] ?? 'Unknow Image URL',
                );
              }).toList(),
            );
          }
        },
      ),
      
      );
    }

  }
