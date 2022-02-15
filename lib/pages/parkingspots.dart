import '../models/reservation.dart';
import '../apis/reservation_api.dart';
import 'package:flutter/material.dart';
import 'booking.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ParkingspotsPage extends StatefulWidget {
  //                      einddatetime = DateTime.parse(eindtijd!);
  //                    begindatetime = DateTime.parse(begintijd!);

  final String? begintijd;
  final String? eindtijd;
  const ParkingspotsPage(
      {Key? key, required this.begintijd, required this.eindtijd})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ParkingspotsPageState();
}

class _ParkingspotsPageState extends State {
  DateTime begindatetime = DateTime.now();
  DateTime einddatetime = DateTime.now();
  List<Reservation> reservationList = [];
  int count = 0;

  @override
  void initState() {
    super.initState();
    _getParkingspots();
  }

  void _checktijd(DateTime begintijd, DateTime eindtijd) {}
  void _getParkingspots() {
    ReservationAPI.fetchParkingspots().then((result) {
      setState(() {
        reservationList = result;
        count = result.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 235, 1),
      appBar: AppBar(
        elevation: 0.0,
        leading: Image.asset("assets/icon.png"),
        title: const Text(
          'Realdolmen Parking',
          style: TextStyle(
            shadows: [Shadow(color: Colors.white, offset: Offset(0, -7))],
            color: Colors.transparent,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            decorationColor: Color.fromRGBO(0, 170, 156, 1),
            decorationThickness: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              tileColor: Color.fromRGBO(35, 45, 75, 1),
              title: RichText(
                text: TextSpan(
                  text: "There are currently ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  children: const <TextSpan>[
                    TextSpan(
                        text: ' 6/12 ',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 170, 156, 1),
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: "spots available",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: _parkingspots(),
            )
          ]),
    );
  }

  ListView _parkingspots() {
    return ListView.builder(
        itemCount: 12, // the length

        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 55,
            child: Card(
              color: Color.fromRGBO(235, 235, 235, 1),
              elevation: 0.0,
              child: ClipPath(
                child: Container(
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.parking,
                      color: Color.fromRGBO(35, 45, 75, 1),
                      size: 30,
                    ),
                    title: Text(
                      "Parking spot " + (index + 1).toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Color.fromRGBO(35, 45, 75, 1),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookingPage()),
                      );
                    },
                    trailing: Icon(Icons.navigate_next,
                        color: Color.fromRGBO(0, 170, 156, 1)),
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 1))),
                ),
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3))),
              ),
            ),
          );
        });
  }
}
