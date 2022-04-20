class trainModel {
  trainModel({
    int? id,
    String? TrainName ,
    DateTime? Departure,
    DateTime? Arrival ,
    String? Type }){
    _id = id;
    _TrainName = TrainName;
    _Departure = Departure;
    _Arrival = Arrival;
    _Type = Type;
  }

  void setType(String type){
    _Type = type;
  }
  void setDeparture(DateTime Departure){
    _Departure = Departure;
  }
  void setArrival(DateTime Arrival){
    _Arrival = Arrival;
  }
  void setTrainName(String trainName){
    _TrainName = trainName;
  }
  trainModel.fromJson(dynamic json) {
    _id = json['id'];
    _TrainName = json['TrainName'];
    _Departure = json['Departure'];
    _Arrival = json['Arrival'];
    _Type = json['Type'];
  }

  int? _id;
  String? _TrainName ;
  DateTime? _Departure ;
  DateTime? _Arrival ;
  String? _Type ;

  int? get id => _id;
  String? get TrainName => _TrainName;
  DateTime? get Departure => _Departure;
  DateTime? get Arrival => _Arrival;
  String? get Type => _Type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['TrainName'] = _TrainName as String;
    map['Departure'] = _Departure as DateTime;
    map['Arrival'] = _Arrival as DateTime;
    map['Type'] = _Type as String ;
    return map;
  }

}