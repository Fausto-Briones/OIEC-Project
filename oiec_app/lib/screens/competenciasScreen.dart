import 'package:flutter/material.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/components/competenciaComponent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

DateTime today = DateTime.now();

class CompetenciasScreen extends StatefulWidget {
  const CompetenciasScreen({super.key});

  @override
  _CompetenciasScreenState createState() => _CompetenciasScreenState();
}

class _CompetenciasScreenState extends State<CompetenciasScreen> {
  late Map<String, dynamic> pastContests;
  late Map<String, dynamic> futureContests;

  @override
  void initState() {
    super.initState();
    pastContests = {};
    futureContests = {};
    fetchContests();
  }

  Future<void> fetchContests() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/contests'));

    if (response.statusCode == 200) {
      Map<String, dynamic> contests = jsonDecode(response.body);
      final Map<String, dynamic> tempPastContests = {};
      final Map<String, dynamic> tempFutureContests = {};

      contests.forEach((key, value) {
        DateTime contestDate = DateTime.parse(value['date']);
        if (contestDate.isBefore(today)) {
          tempPastContests[key] = value;
        } else {
          tempFutureContests[key] = value;
        }
      });

      setState(() {
        pastContests = tempPastContests;
        futureContests = tempFutureContests;
      });
    } else {
      print('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Competencias",
      body: DefaultTabController(
        length: 2,
        child: Column(
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
                return CompetenciaComponent(
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
