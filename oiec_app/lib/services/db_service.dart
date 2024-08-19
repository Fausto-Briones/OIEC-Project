// service/database.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class DatabaseService {
  static final String baseUrl = 'https://dereck.pythonanywhere.com/api'; // Replace with your IP address
  static final DateTime today = DateTime.now();
  
  static Future<Map<String,Map<String, dynamic>>> fetchContests() async {
    final response = await http.get(Uri.parse('$baseUrl/contests'));

    if (response.statusCode == 200) {
      Map<String, dynamic> contests = jsonDecode(response.body);
      Map<String, dynamic> pastContests = {};
      Map<String, dynamic> futureContests = {};

      contests.forEach((key, value) {
        DateTime contestDate = DateTime.parse(value['date']);
        if (contestDate.isBefore(today)) {
          pastContests[key] = value;
        } else {
          futureContests[key] = value;
        }
      });

      return {
        'pastContests': pastContests,
        'futureContests': futureContests,
      };
    } else {
      throw Exception('Failed to load contests');
    }
  }

  static Future<Map<String,Map<String,dynamic>>> fetchNews() async {
    final response = await http.get(Uri.parse('$baseUrl/announcements'));

    if (response.statusCode == 200){
      Map<String,dynamic> news = jsonDecode(response.body);
      
      return {
        'news':news
      };

    } else {
      throw Exception('Failed to load news');
    }

  }

  static Future<Map<String,Map<String, dynamic>>> fetchPastResults(String cedula) async {
    final response = await http.get(Uri.parse('$baseUrl/participants/$cedula/pastcontests/'));

    if (response.statusCode == 200) {
      Map<String,dynamic> pastResults = jsonDecode(response.body);
      return {
        'results':pastResults
      };

    } else {
      throw Exception('Failed to load news');
    }
  }

  static Future<Map<String,Map<String, dynamic>>> fetchPayments() async {
    final response = await http.get(Uri.parse('$baseUrl/payments'));

    if (response.statusCode == 200) {
      Map<String, dynamic> pagos = jsonDecode(response.body);

      return {
        'payments': pagos,
      };
    } else {
      throw Exception('Failed to load payments');
    }
  }

}
