import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
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
          return Stack(
            children: buildMarkerList(champions),
          );
        },
      ),
    );
  }

  List<Widget> buildMarkerList(List<Champion> champions) {
    Map<Point, List> duplicatedChampionsLocationCheck = new Map<Point, List>();
    List<Widget> championWidgetList = List.generate(
      champions.length,
      (index) {
        Champion champion = champions[index];
        double size = champion.info['attack'] + champion.info['magic'];
        double x =
            champion.info['attack'] - champion.info['magic']; //x축으로 ap ad 표시
        double y = champion.info['defense']; // 방어력 y축
        double position_x = x * 0.1; //(0~1) <- (0~10)
        double position_y = -1 + y * 0.2;
//              0   1    2   3     4   5   6   7   8    9    10 : 10
//              -1 -0.8 -0.6 -0.4 -0.2  0  0.2 0.4 0.6  0.8    1

        ///////////////////겹치는 챔피언 위치 저장////////////////////////////
        Point p = Point(position_x, position_y);
        if (duplicatedChampionsLocationCheck[p] == null) {
          duplicatedChampionsLocationCheck[p] = [champion.name];
        }
        else if (duplicatedChampionsLocationCheck[p]!=null){
          duplicatedChampionsLocationCheck[p].add(champion.name);
        }

        /////////////////////초상화출력//////////////////////////////
        return Align(
          alignment: Alignment(position_x, position_y),
          child: CachedNetworkImage(
            width: 30, //size,//size * size * 0.5,
            height: 30, //size,//size * size * 0.5,
            imageUrl:
                'https://ddragon.leagueoflegends.com/cdn/$version/img/champion/${champions[index].id}.png',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          //Text(champion.name),
        );
      },
    );

    print(duplicatedChampionsLocationCheck);//결과: {Point(0.5, -0.19999999999999996): [아트록스, 제이스, 렝가], Point(-0.5, -0.19999999999999996): [아리, 사일러스], Point(-0.30000000000000004, -0.3999999999999999): [아칼리, 나미],

    //x,y가 같은 초상화는 새로운 위젯(버튼:누르면 해당 위치의 챔피언들을 보여주는)에 넣어준다
    List<Widget> newChampionWidgetList = (championWidgetList.map((widget) {
      return widget;
    })).toList();
    print("somethign");
    return newChampionWidgetList;
  }
}
