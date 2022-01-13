import 'dart:convert';

import 'package:thein_test/models/exhibit.dart';
import 'package:http/http.dart' as http;

abstract class ExhibitsLoader {
  Future<List<Exhibit>> getExhibitList();
}
