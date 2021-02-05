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
      body: Center(
        child: Container(
          width: screen_width * 0.5,
          height: screen_height * 0.6,
          child: GridView.builder(
            itemCount: champion_num,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTapUp: (TapUpDetails details){
                  print(details);
                },
                onDoubleTap: (){
                  print("double click");
                  print("show menu: 탑선호 챔피언/정글선호 챔피언/미드선호 챔피언/원딜선호 챔피언/서폿선호 챔피언");
                  Future<String> latestVersion = server.fetchLatestVersion();
                  latestVersion.then((val) {
                    // int가 나오면 해당 값을 출력
                    print('val: $val');
                  }).catchError((error) {
                    // error가 해당 에러를 출력
                    print('error: $error');
                  });

                  print('기다리는 중');
                },
                child: Container(
                  child:
                      Column(
                        children: [
                          Expanded(child: Image.network('https://ddragon.leagueoflegends.com/cdn/10.11.1/img/champion/Teemo.png',)),
                          Text("Item $index",),
                        ],
                      ),
//                color: Colors.green,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
