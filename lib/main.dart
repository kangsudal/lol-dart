import 'package:flutter/material.dart';
import 'package:limitless_oasis/widget/championGridView.dart';
import 'package:limitless_oasis/widget/versionText.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screen_size = MediaQuery.of(context).size;
    double screen_width = screen_size.width;
    double screen_height = screen_size.height;

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
                  Container(),
                  Container(),
                  Container(),
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
}
