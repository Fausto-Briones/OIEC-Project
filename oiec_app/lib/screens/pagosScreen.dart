import 'package:flutter/material.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/components/customContainer.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/db_service.dart';

class PagosScreen extends StatefulWidget {
  const PagosScreen({super.key});

  @override
  _PagosScreenState createState() => _PagosScreenState();

  
}

class _PagosScreenState extends State<PagosScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(title: "Pagos", 
      body:  Column(
        children: [
          FutureBuilder<Map<String, Map<String, dynamic>>>(
          future: DatabaseService.fetchPayments(),
          builder:(context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator while the data is being fetched
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Handle errors
              return const Center(child: Text('Failed to load payments.'));
            } else if (snapshot.hasData) {
              // Once data is loaded, display the tabs with contests
              final pagos = snapshot.data!['payments']!;

              return _Pagos(pagos);
            } else {
              // Handle the case where snapshot has no data
              return const Center(child: Text('No hay pagos disponibles.'));
            }
          },
          
          ),
        ],
      ),
    );
  }

}

class _Pagos extends StatelessWidget {
  final Map<String, dynamic> pagos;

  _Pagos(this.pagos);

  @override
  Widget build(BuildContext context){
    return pagos.isEmpty 
    ? const Center(
            child: Text(
              'No hay pagos disponibles.',
              style: TextStyle(color: Colors.white),
            ),
          )
    : Column(
            children: pagos.values.map((pago){
              return CustomContainer(
                child: _PagosContent(
                  competencia: pago['contest'] ?? 'None', 
                  fecha: DateFormat.yMMMMd().format(DateTime.parse(pago['date'])), 
                  participant: pago['participant'] ?? 'None',
                )
              );
            }).toList(),
      );
  }
  
  
}


class _PagosContent extends StatelessWidget {
  final String competencia;
  final String fecha;
  final String participant;

  const _PagosContent({required this.competencia, required this.fecha, required this.participant});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text(competencia), Text(fecha), Text(participant)],
        ),
        const Icon(
          Icons.picture_as_pdf,
        ),
      ],
    );
  }
}
