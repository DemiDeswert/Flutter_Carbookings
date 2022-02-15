import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/spotsavailable.dart';
import 'dart:async';

class SpotsAvailableApi {
  static String server = 'p40backend.azurewebsites.net';
  static Future<List<Spotsavailable>> fetchSpots() async {
    var url = Uri.https(server, '/api/Parkings');

    final response = await http.get(url, headers: {
      'authorization':
          'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiIxIiwiRW1haWwiOiJhZG1pbkBhZG1pbi5jb20iLCJVc2VyTGV2ZWwiOiIxIiwibmJmIjoxNjQzNzkxMzA4LCJleHAiOjE2NzUzMjczMDgsImlhdCI6MTY0Mzc5MTMwOH0.0UGtqMC8Qsokx10Pza9G29jX_iJUddgEb-6wNgR8msQ'
    });

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((spotsavailable) => Spotsavailable.fromJson(spotsavailable))
          .toList();
    } else {
      throw Exception('Failed to load Spots');
    }
  }
}
