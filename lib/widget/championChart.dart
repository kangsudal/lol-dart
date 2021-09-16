import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:limitless_oasis/model/dio_server.dart';

class ChampionChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChampionChartState();
}

class _ChampionChartState extends State {
  int touchedIndex;

  Color greyColor = Colors.grey;

  List<int> selectedSpots = [];

  int lastPanStartOnIndex = -1;

  Server server = Server();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0x55217222),
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0,0),
            child: Icon(Icons.face),
          ),
          Align(
            alignment: Alignment(1,0),
            child: Icon(Icons.face),
          ),
        ],
      ),
    );
  }
}
