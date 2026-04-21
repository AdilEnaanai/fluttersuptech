import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tp5/model/Reclamation.dart';

class ReclamationService {
  static const String baseUrl =
      "https://697ab6680e6ff62c3c59f3ab.mockapi.io/reclamations";

  static Future<List<Reclamation>> getReclamations() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.take(10).map((json) => Reclamation.fromJson(json)).toList();
    } else {
      throw Exception('Erreur de chargement');
    }
  }
}
