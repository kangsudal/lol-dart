import 'package:dio/dio.dart';

const _API_PREFIX =
    "http://ddragon.leagueoflegends.com";
const _API_SUFFIX_CHAMPION = "/cdn/11.3.1/data/ko_KR/champion.json";
const _API_SUFFIX_VERSION = "/api/versions.json";


class Server {
  Future<void> getChampion() async {
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.get("$_API_PREFIX$_API_SUFFIX_CHAMPION");

      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAllVersion() async{
    try{
      Response response;
      Dio dio = new Dio();
      response = await dio.get("$_API_PREFIX$_API_SUFFIX_VERSION");
      print(response.data);
    }catch(e){
      print(e);
    }
  }

  Future<String> fetchLatestVersion() async{
    try{
      Response response;
      Dio dio = new Dio();
      response = await dio.get("$_API_PREFIX$_API_SUFFIX_VERSION");
//      print(response.data[0]);
      return response.data[0];
    }catch(e){
      print(e);
    }
  }
}
Server server = Server();
