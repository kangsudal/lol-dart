import 'package:flutter/material.dart';
import 'package:limitless_oasis/model/dio_server.dart';

class ChampionGridView extends StatelessWidget {
  int champion_num = 120;
  Server server = Server();
  @override
  Widget build(BuildContext context) {
    server.getChampion();
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
    );
  }
}
