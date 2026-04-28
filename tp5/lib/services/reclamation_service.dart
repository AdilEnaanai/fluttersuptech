import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tp5/model/Reclamation.dart';

class ReclamationService {
  static const String baseUrl =
      "https://69e7917d68208c1debe91858.mockapi.io/Reclamations";

  static Future<List<Reclamation>> getReclamations({
    int page = 1,
    int limit = 20,
  }) async {
    final response = await http.get(
      Uri.parse(baseUrl + "?page=$page&limit=$limit"),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Reclamation.fromJson(json)).toList();
    } else {
      throw Exception('Erreur de chargement');
    }
  }
}
