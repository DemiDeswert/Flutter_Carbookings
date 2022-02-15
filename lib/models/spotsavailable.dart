class Spotsavailable {
  int id;
  int freeSpots;
  String timestamp;

  Spotsavailable(
      {required this.id, required this.freeSpots, required this.timestamp});

  factory Spotsavailable.fromJson(Map<String, dynamic> json) {
    return Spotsavailable(
      id: json['id'],
      freeSpots: json['free_spots'],
      timestamp: json['timestamp'],
    );
  }
  Map<String, dynamic> toJson() => {
        'free_spots': freeSpots,
        'timestamp': timestamp,
      };
}
