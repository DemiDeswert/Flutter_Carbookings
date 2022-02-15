// ignore_for_file: prefer_const_constructors
import '../models/spotsavailable.dart';
import '../apis/spotsavailable_api.dart';
import 'package:booking_carspot_app/pages/datepicker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LiveParkingspotsPage extends StatefulWidget {
  const LiveParkingspotsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LiveParkingspotsPageState();
}

class _LiveParkingspotsPageState extends State {
  int count = 0;
  List<Spotsavailable> spotList = [];
  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  void _getUsers() {
    SpotsAvailableApi.fetchSpots().then((result) {
      setState(() {
        spotList = result;
        count = result.length - 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
        appBar: AppBar(
          elevation: 2.0,
          leading: Image.asset("assets/icon.png"),
          title: const Text(
            'Live Parking',
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
        body: Padding(
          child: _parkingspotList(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        ));
  }

  ListView _parkingspotList() {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
          color: Color.fromRGBO(35, 45, 75, 1),
          child: RichText(
            text: TextSpan(
              // text: spotList[count].freeSpots.toString(),
              text: "12 ",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              children: const <TextSpan>[
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
        Lottie.asset('assets/parking.json'),
        Row(
          children: <Widget>[
            Container(color: Colors.white),
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DatePickerPage()),
                );
              },
              child: const Text(
                "Reserve",
                style: TextStyle(fontSize: 25),
              ),
            ))
          ],
        ),
      ],
    );
  }
}
  //     body: Container(

  //       height: 250,
  //       margin: new EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
  //       child: Card(
  //         color: Color.fromRGBO(35, 45, 75, 1),
  //         elevation: 0.0,
  //         child: Container(
  //             child: ListTile(
  //           leading: Text("LIVE",
  //               style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white,
  //                   backgroundColor: Colors.red)),
  //           title: RichText(
  //             text: TextSpan(
  //               text: ' 6/12 ',
  //               style: TextStyle(
  //                   color: Color.fromRGBO(0, 170, 156, 1),
  //                   fontWeight: FontWeight.bold),
  //               children: const <TextSpan>[
  //                 TextSpan(
  //                   text: "spots available",
  //                   style: TextStyle(
  //                       color: Colors.white, fontWeight: FontWeight.bold),
  //                 )
  //               ],
  //             ),
  //             textAlign: TextAlign.center,

  //           ),

  //         )

  //         ),
  //       ),
  //     ),
  //   );
  // }

