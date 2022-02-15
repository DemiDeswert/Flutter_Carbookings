class Reservation {
  int id;
  int parkingspotNumber;
  String licensePlate;
  String beginTijd;
  String eindTijd;

  Reservation(
      {required this.id,
      required this.parkingspotNumber,
      required this.licensePlate,
      required this.beginTijd,
      required this.eindTijd});

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      parkingspotNumber: json['parkingspotNumber'],
      licensePlate: json['licensePlate'],
      beginTijd: json['beginTijd'],
      eindTijd: json['eindTijd'],
    );
  }

  Map<String, dynamic> toJson() => {
        'parkingspotNumber': parkingspotNumber,
        'licensePlate': licensePlate,
        'beginTijd': beginTijd,
        'eindTijd': eindTijd,
      };
}
