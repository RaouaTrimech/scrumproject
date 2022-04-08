// To parse this JSON data, do
//
//     final passengersData = passengersDataFromJson(jsonString);




import 'dart:convert';

TrainsData trainsDataFromJson(String str) => TrainsData.fromJson(json.decode(str));

String trainsDataToJson(TrainsData data) => json.encode(data.toJson());

class TrainsData {
  TrainsData({
    required this.totalTrains,
    required this.totalPages,
    required this.data,
  });

  int totalTrains;
  int totalPages;
  List<Train> data;

  factory TrainsData.fromJson(Map<String, dynamic> json) => TrainsData(
    totalTrains: json["totalTrains"],
    totalPages: json["totalPages"],
    data: List<Train>.from(json["data"].map((x) => Train.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalTrains": totalTrains,
    "totalPages": totalPages,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Train {
  String TrainName ='';
  DateTime Departure =DateTime.now();
  DateTime Arrival =DateTime.now() ;
  String Type  ='';

  Train({
    required this.TrainName,
    required this.Departure,
    required this.Arrival,
    required this.Type,
  });

  factory Train.fromJson(Map<String, dynamic> json) => Train(
    TrainName: json["TrainName"],
    Departure: json["Departure"],
    Arrival: json["Arrival"],
    Type: json["Type"],
  );

  Map<String, dynamic> toJson() => {
    "TrainName": TrainName,
    "Departure": Departure,
    "Arrival": Arrival,
    "Type": Type,
  };
}



