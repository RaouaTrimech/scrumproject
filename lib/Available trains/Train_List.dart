import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scrumproject/Available%20trains/trainButton.dart';

import '../Train details/ButtomNavbar.dart';
import 'TrainsData.dart';


class trainList extends StatefulWidget {
  const trainList({Key? key}) : super(key: key);

  @override
  State<trainList> createState() => _trainListState();
}

class _trainListState extends State<trainList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height:41 ,
                        color:Color.fromRGBO(168, 212, 239, 1),
                      ),
                      Container(
                        height:41 ,
                        color:Color.fromRGBO(168, 212, 239, 0.66),
                      ),
                      Container(
                        height:41 ,
                        color:Color.fromRGBO(204, 235, 230, 1),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Text(
                        "Available Trains",
                        style: TextStyle(
                          fontFamily: "Prata" ,
                          color: Color.fromRGBO(88, 89, 91, 1),
                          fontSize: 40,
                        ),
                      ),
                      Expanded(
                        child:list(),
                      ),
                    ]
                )),
            const ButtomNavbar()]),
    );
  }
}

class list extends StatefulWidget {
  const list({Key? key}) : super(key: key);

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  int currentPage =1;
  int totalPages=10;
  //pour tester
  //Train t = new Train(TrainName: 'TrainName', Departure: DateTime.now(), Arrival: DateTime.now(), Type: "Type");
  List<Train> trains = [];
  final RefreshController refreshController =
  RefreshController(initialRefresh: true);


  Future<bool> getTrainData({ bool isRefresh = false}) async {
    //pour tester
    //trains.add(t);

    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }

    final Uri uri = Uri.parse(
        "http://192.168.0.7:8080/trainList");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = trainsDataFromJson(response.body);

      if (isRefresh) {
        trains = result.data;
      }else{
        trains.addAll(result.data);
      }

      currentPage++;

      totalPages = result.totalPages;

      //print(response.body);
      setState(() {});
      return true;
    } else {
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return  SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      onRefresh: () async {
        final result = await getTrainData(isRefresh: true);
        if (result) {
          refreshController.refreshCompleted();
        } else {
          refreshController.refreshFailed();
        }
      },
      onLoading: () async {
        final result = await getTrainData();
        if (result) {
          refreshController.loadComplete();
        } else {
          refreshController.loadFailed();
        }
      },
      child: ListView.separated(
        itemBuilder: (context, index) {
          final train = trains[index];

          return trainButton(TrainName: train.TrainName,
              Arrival: train.Arrival, Departure: train.Departure,
              Type: train.Type);
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: trains.length,
      ),
    );
  }
}