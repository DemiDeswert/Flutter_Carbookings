import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/reservation.dart';

class ReservationAPI {
  static String server = 'p40backend.azurewebsites.net';
  static Future<List<Reservation>> fetchParkingspots() async {
    var url = Uri.https(server, '/api/Parkingspots');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((reservation) => Reservation.fromJson(reservation))
          .toList();
    } else {
      throw Exception('Failed to load reservation');
    }
  }
}
