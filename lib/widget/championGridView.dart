import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:limitless_oasis/model/champion.dart';
import 'package:limitless_oasis/model/dio_server.dart';
//todo: 1. 한글순서정렬, 2. 트페 기좀 세워주기

class ChampionGridView extends StatelessWidget {
  int champion_num = 3;
  Server server = Server();
  @override
  Widget build(BuildContext context) {
    server.getChampion();
//    return buildGridView();
    return FutureBuilder(
        future: server.getChampion(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //data를 아직 받아오지 못했을때
          if (snapshot.hasData == false) {
            return CircularProgressIndicator();
          }
          //error 발생시
          else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(fontSize: 15),
              ),
            );
          }
          //정상적으로 데이터 받아왔을때
          else {
            return buildGridView(snapshot.data);
          }
        });
  }

  GridView buildGridView(List<Champion> data) {
    List<Champion> champions = data;
    champion_num = champions.length; //받아온 데이터에서 챔피언 개수 반영
    return GridView.builder(
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
            print("show menu: 탑선호 챔피언/정글선호 챔피언/미드선호 챔피언/원딜선호 챔피언/서폿선호 챔피언");
          },
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl:'https://ddragon.leagueoflegends.com/cdn/$version/img/champion/${champions[index].id}.png',
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Text(
                  "${champions[index].name}",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
