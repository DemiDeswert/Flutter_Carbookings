import 'package:booking_carspot_app/pages/booking.dart';
import 'package:booking_carspot_app/pages/parkingspots.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State {
  DateTime begindatetime = DateTime.now();
  DateTime einddatetime = DateTime.now();
  static String? begintijd = DateTime.now().toString();
  static String? eindtijd = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
        appBar: AppBar(
          elevation: 0.0,
          leading: Image.asset("assets/icon.png"),
          title: const Text(
            'Select Date',
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
          child: ListView(
            children: <Widget>[
              Text(
                'Begin tijd',
              ),
              DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2022),
                lastDate: DateTime(2100),
                icon: const Icon(Icons.event),
                dateLabelText: 'Date',
                timeLabelText: "Hour",
                onChanged: (val) => begintijd = val + ":00.000",
                validator: (val) {
                  print(val);
                  begintijd = val;
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              const Divider(height: 50.0, color: Colors.transparent),
              Text(
                'Eind tijd',
              ),
              DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2022),
                lastDate: DateTime(2100),
                icon: const Icon(Icons.event),
                dateLabelText: 'Date',
                timeLabelText: "Hour",
                onChanged: (val) => eindtijd = val + ':00.000',
                validator: (val) {
                  eindtijd = val;
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      print(begintijd);
                      print(eindtijd);
                      _navigateToParkingspots(begintijd, eindtijd);
                    },
                    child: const Text("Next"),
                  ))
                ],
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        ));
  }

  void _navigateToParkingspots(String? begintijd, String? eindtijd) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ParkingspotsPage(
                begintijd: begintijd,
                eindtijd: eindtijd,
              )),
    );
  }
}
