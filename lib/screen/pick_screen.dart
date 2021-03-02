import 'package:flutter/material.dart';
import 'package:limitless_oasis/widget/championChart.dart';
import 'package:limitless_oasis/widget/championChart2.dart';
import 'package:limitless_oasis/widget/championChart3.dart';
import 'package:limitless_oasis/widget/championGridView.dart';
import 'package:limitless_oasis/widget/versionText.dart';

Widget pick_screen(double screen_width, double screen_height) {
  return Scaffold(
    backgroundColor: Colors.blue,
    body: Center(
      child: Container(
        width: screen_width * 0.5,
        height: screen_height * 0.6,
        child: DefaultTabController(
          length: 6,
          child: Scaffold(
            appBar: AppBar(
              title: VersionText(),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'ALL',
                  ),
                  Tab(
                    text: 'TOP',
                  ),
                  Tab(
                    text: 'JUNGLE',
                  ),
                  Tab(
                    text: 'MID',
                  ),
                  Tab(
                    text: 'SUPPORT',
                  ),
                  Tab(
                    text: 'ADC',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ChampionGridView(),
                ChampionChart(),
                ScatterPlotComboLineChart.withRandomData(),
                LineChartSample2(),
                Container(),
                Container(),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}