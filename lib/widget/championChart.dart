import 'dart:convert';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:limitless_oasis/model/champion.dart';
import 'package:limitless_oasis/model/dio_server.dart';

class ChampionChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChampionChartState();
}

class _ChampionChartState extends State {
  Server server = Server();

  @override
  Widget build(BuildContext context) {
    Future<List<Champion>> _calculation = server.getChampion();
    return Card(
      color: const Color(0x55217222), //card color
      child: FutureBuilder(
        future: _calculation,
        builder: (BuildContext ctx, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error :( ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return const Text('Nothing to show');
          }
          List<Champion> champions = snapshot.data;
          print(champions);
          return Stack(
            children: List.generate(
              champions.length,
              (index) {
                Champion champion = champions[index];
                double size = champion.info['attack'] + champion.info['magic'];
                double x = champion.info['attack'] -
                    champion.info['magic']; //x축으로 ap ad 표시
                double y = champion.info['defense']; // 방어력 y축
                double position_x = x * 0.1; //(0~1) <- (0~10)
                double position_y = -1 + y * 0.2;
//              0   1    2   3     4   5   6   7   8    9    10 : 10
//              -1 -0.8 -0.6 -0.4 -0.2  0  0.2 0.4 0.6  0.8    1

                return Align(
                  alignment: Alignment(position_x, position_y),
                  child: Text(champion.name),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
