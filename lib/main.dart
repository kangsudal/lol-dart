import 'package:flutter/material.dart';
import 'package:limitless_oasis/model/dio_server.dart';

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
    int champion_num = 120;

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
                title: FutureBuilder(
                    future: server.fetchLatestVersion(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                      if (snapshot.hasData == false) {
                        return CircularProgressIndicator();
                      }
                      //error가 발생하게 될 경우 반환하게 되는 부분
                      else if (snapshot.hasError) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Error: ${snapshot.error}',
                            style: TextStyle(fontSize: 15),
                          ),
                        );
                      }
                      // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
                      else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data.toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                        );
                      }
                    }),
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
                  GridView.builder(
                    itemCount: champion_num,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTapUp: (TapUpDetails details) {
                          print(details);
                        },
                        onDoubleTap: () {
                          print("double click");
                          print(
                              "show menu: 탑선호 챔피언/정글선호 챔피언/미드선호 챔피언/원딜선호 챔피언/서폿선호 챔피언");
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Expanded(
                                  child: Image.network(
                                'https://ddragon.leagueoflegends.com/cdn/10.11.1/img/champion/Teemo.png',
                              )),
                              Text(
                                "Item $index",
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
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
