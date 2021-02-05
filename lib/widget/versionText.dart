import 'package:flutter/material.dart';
import 'package:limitless_oasis/model/dio_server.dart';

class VersionText extends StatelessWidget {
  Server server = Server();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
      },
    );
  }
}
