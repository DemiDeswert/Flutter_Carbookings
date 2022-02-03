// ignore_for_file: unnecessary_new, prefer_const_constructors
import 'package:flutter/material.dart';
import 'booking.dart';

class ParkingspotsPage extends StatefulWidget {
  const ParkingspotsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ParkingspotsPageState();
}

class _ParkingspotsPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/icon.png"),
        title: const Text('Realdolmen Parking'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(5.0),
        child: _parkingspots(),
      ),
    );
  }

  ListView _parkingspots() {
    return ListView.builder(
        itemCount: 8, // the length
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: (index % 2 == 0)
                ? Color.fromRGBO(0, 170, 156, 1)
                : Color.fromRGBO(35, 45, 75, 1),
            elevation: 2.0,
            child: ListTile(
              leading: Icon(
                Icons.local_parking,
                color: Colors.white,
                size: 40,
              ),
              title: Text(
                "Parking " + (index + 1).toString(),
                textAlign: TextAlign.center,
              ),
              textColor: Colors.white,
              onTap: () {
                debugPrint("Tapped on " + index.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BookingPage()),
                );
              },
            ),
          );
        });
  }
}
