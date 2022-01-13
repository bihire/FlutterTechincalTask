import 'dart:convert';

import 'package:thein_test/models/exhibit.dart';
import 'package:http/http.dart' as http;
import 'package:thein_test/services/exhibit_loader.dart';

class ExhibitsGet implements ExhibitsLoader {
  @override
  Future<List<Exhibit>> getExhibitList() async {
    final response = await http.get(
        Uri.parse('https://my-json-server.typicode.com/Reyst/exhibit_db/list'));
    final jsonData = json.decode(response.body) as List;

    if (response.statusCode == 200) {
      return jsonData.map((exhibit) => Exhibit.fromJson(exhibit)).toList();
    } else {
      throw Exception('Failed to load exhibits');
    }
  }
}
