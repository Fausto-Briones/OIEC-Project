import 'package:flutter/material.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/components/customContainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oiec_app/globals.dart';

class ProblemasScreen extends StatelessWidget {
  const ProblemasScreen({super.key});

  Future<List<Map<String, dynamic>>> _filtrarProblemasPorUsuario(String userId) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Obtén todos los documentos en la colección 'Problems'
    final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore.collection('Problems').get();

    // Filtra los documentos según el userId
    final List<Map<String, dynamic>> problemasFiltrados = snapshot.docs
        .where((doc) => doc.data()['assignedTo'] == userId)
        .map((doc) => {
              'tituloProblema': doc.id,
              'descripcion': doc.data()['description'],
              'completado': doc.data()['status']
            })
        .toList();

    return problemasFiltrados;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _filtrarProblemasPorUsuario(cedula),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No hay problemas asignados.'));
        } else {
          final problemasFiltrados = snapshot.data!;

          return MainLayout(
            title: "Problemas Asignados",
            body: Column(
              children: problemasFiltrados.map((problema) {
                return CustomContainer(
                  child: _ProblemsContent(
                    tituloProblema: problema['tituloProblema'],
                    descripcion: problema['descripcion'],
                    completado: problema['completado'],
                  ),
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}

class _ProblemsContent extends StatelessWidget {
  final String tituloProblema;
  final String descripcion;
  final bool completado;

  const _ProblemsContent(
      {required this.tituloProblema,
      required this.descripcion,
      required this.completado});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text(tituloProblema), Text(descripcion), Text(completado ? "Hecho." : "Por realizar")],
        ),
        Icon(
          Icons.circle,
          color: completado ? Colors.green : Colors.orange,
        ),
      ],
    );
  }
}