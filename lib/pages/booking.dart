import 'package:booking_carspot_app/pages/liveparkingspots.dart';
import 'package:booking_carspot_app/pages/parkingspots.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookingPageState();
}

class _BookingPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
        appBar: AppBar(
          leading: Image.asset("assets/icon.png"),
          title: const Text('Booking'),
          centerTitle: true,
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LiveParkingspotsPage()),
                    );
                  },
                  child: const Icon(
                    Icons.keyboard_return,
                    color: Color.fromRGBO(0, 170, 156, 1),
                    size: 26.0,
                  ),
                )),
          ],
        ),
        body: Padding(
          child: ListView(
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(
                  label: Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(
                          child: Text(
                            'Fullname',
                          ),
                        ),
                        WidgetSpan(
                          child: Text(
                            '*',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  label: Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(
                          child: Text(
                            'License plate',
                          ),
                        ),
                        WidgetSpan(
                          child: Text(
                            '*',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // DateTimePicker(
              //   type: DateTimePickerType.dateTimeSeparate,
              //   dateMask: 'd MMM, yyyy',
              //   initialValue: DateTime.now().toString(),
              //   firstDate: DateTime(2022),
              //   lastDate: DateTime(2100),
              //   icon: const Icon(Icons.event),
              //   dateLabelText: 'Date',
              //   timeLabelText: "Hour",
              // ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LiveParkingspotsPage()),
                      );
                    },
                    child: const Text("Save"),
                  ))
                ],
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        ));
  }
}
