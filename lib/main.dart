import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import utils for specific color
import '/utils.dart';
import 'pages/liveparkingspots.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(const UserManagementApp());
  });
}

class UserManagementApp extends StatelessWidget {
  // This widget is the root of your application.
  const UserManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RealDolmen Parking',
      theme: ThemeData(
          primarySwatch:
              createMaterialColor(const Color.fromRGBO(35, 45, 75, 1))),
      home: const LiveParkingspotsPage(),
    );
  }
}
