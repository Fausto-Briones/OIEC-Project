import 'package:flutter/material.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/components/competenciaComponent.dart';
import 'package:oiec_app/components/competenciaPastComponent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:oiec_app/services/db_service.dart';

DateTime today = DateTime.now();

class CompetenciasScreen extends StatefulWidget {
  const CompetenciasScreen({super.key});

  @override
  _CompetenciasScreenState createState() => _CompetenciasScreenState();
}

class _CompetenciasScreenState extends State<CompetenciasScreen> {


  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Competencias",
      body: DefaultTabController(
        length: 2,
        child: FutureBuilder<Map<String, Map<String, dynamic>>>(
          future: DatabaseService.fetchContests(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator while the data is being fetched
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Handle errors
              return const Center(child: Text('Failed to load contests.',style: TextStyle(color: Colors.white),));
            } else if (snapshot.hasData) {
              // Once data is loaded, display the tabs with contests
              final pastContests = snapshot.data!['pastContests']!;
              final futureContests = snapshot.data!['futureContests']!;

              return Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(text: 'Pasadas'),
                      Tab(text: 'Futuras'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _Pasadas(pastContests),
                        _Futuras(futureContests),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              // Handle the case where snapshot has no data
              return const Center(child: Text('No hay competencias disponibles.'));
            }
          },
        ),
      ),
    );
  }
}

class _Futuras extends StatelessWidget {
  final Map<String, dynamic> futureContests;

  _Futuras(this.futureContests);

  @override
  Widget build(BuildContext context) {
    return futureContests.isEmpty
        ? const Center(
            child: Text(
              'No hay competencias futuras disponibles.',
              style: TextStyle(color: Colors.white),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: futureContests.values.map((futureContest) {
                return CompetenciaComponent(
                  competencia: futureContest['name'] ?? 'Unnamed Contest',
                  lugar: futureContest['location'] ?? 'Unknown Location',
                  fecha: DateFormat.yMMMMd().format(DateTime.parse(futureContest['date'])),
                  modalidad: futureContest['mode'] ?? 'Unknown Mode',
                  form: futureContest['form'] ?? 'https://oiec-inf.org/',
                );
              }).toList(),
            ),
          );
  }
}

class _Pasadas extends StatelessWidget {
  final Map<String, dynamic> pastContests;

  _Pasadas(this.pastContests);

  @override
  Widget build(BuildContext context) {
    return pastContests.isEmpty
        ? const Center(
            child: Text(
              'No hay competencias pasadas disponibles.',
              style: TextStyle(color: Colors.white),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: pastContests.length,
              itemBuilder: (context, index) {
                final pastContest = pastContests.values.toList()[index];
                return CompetenciaPastComponent(
                  competencia: pastContest['name'] ?? 'Unnamed Contest',
                  lugar: pastContest['location'] ?? 'Unknown Location',
                  fecha: DateFormat.yMMMMd().format(DateTime.parse(pastContest['date'])),
                  modalidad: pastContest['mode'] ?? 'Unknown Mode',

                );
              },
            ),
          );
  }
}
