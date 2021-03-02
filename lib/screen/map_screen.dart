import 'package:flutter/material.dart';
import 'package:limitless_oasis/widget/simplescatterplotchart.dart';

Widget map_screen(double screen_width, double screen_height){
  return Scaffold(
    body: Container(
      width: screen_width * 0.5,
      height: screen_height * 0.6,
      child: SimpleScatterPlotChart.withSampleData(),
    ),
  );
}