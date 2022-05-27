class trainModel {
  trainModel({
    int? id,
    String? TrainName ,
    DateTime? Departure,
    DateTime? Arrival ,
    String? Type ,
    int? Line,
    int? ArrStat,
    int? DepStat}){
    _id = id;
    _TrainName = TrainName;
    _Departure = Departure;
    _Arrival = Arrival;
    _Type = Type;
    _Line = Line;
    _ArrStat = ArrStat ;
    _DepStat = DepStat ;
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

  void setLine(int Line){
    _Line = Line;
  }
  void setArrStat(int ArrStat){
    _ArrStat = ArrStat;
  }

  void setDepStat(int DepStat){
    _DepStat = DepStat;
  }

  trainModel.fromJson(dynamic json) {
    _id = json['id'];
    _TrainName = json['TrainName'];
    _Departure = json['Departure'];
    _Arrival = json['Arrival'];
    _Type = json['Type'];
    _Line = json['Line'];
    _ArrStat = json['stationArr'];
    _DepStat = json['stationDep'];
  }

  int? _id;
  String? _TrainName ;
  DateTime? _Departure ;
  DateTime? _Arrival ;
  String? _Type ;
  int? _Line ;
  int? _ArrStat ;
  int? _DepStat ;

  int? get id => _id;
  String? get TrainName => _TrainName;
  DateTime? get Departure => _Departure;
  DateTime? get Arrival => _Arrival;
  String? get Type => _Type;
  int? get Line => _Line;
  int? get ArrStat => _ArrStat;
  int? get DepStat => _DepStat;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['TrainName'] = _TrainName as String;
    map['Departure'] = _Departure as DateTime;
    map['Arrival'] = _Arrival as DateTime;
    map['Type'] = _Type as String ;
    map['Line'] = _Line as int ;
    map['ArrStat'] = _ArrStat as int ;
    map['DepStat'] = _DepStat as int ;

    return map;
  }

}