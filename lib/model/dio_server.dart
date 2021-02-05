import 'package:dio/dio.dart';
import 'package:limitless_oasis/model/adapter.dart';

import 'champion.dart';

const _API_PREFIX = "http://ddragon.leagueoflegends.com";
const _API_SUFFIX_VERSION = "/api/versions.json";
String version = "11.3.1";
String _API_SUFFIX_CHAMPION;

class Server {
  Future<void> getChampion() async {
    try {
      version = await fetchLatestVersion();
    } catch (e) {
      print(e);
      version = "11.3.1";
    }
    _API_SUFFIX_CHAMPION = "/cdn/" + version + "/data/ko_KR/champion.json";
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.get("$_API_PREFIX$_API_SUFFIX_CHAMPION");

      dynamic data =response.data["data"];
//      print(parseChampions(data));
      return parseChampions(data);
//      Champion anivia = Champion.fromJson(response.data["data"]["Anivia"]);
//      print(anivia.partype);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAllVersion() async {
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.get("$_API_PREFIX$_API_SUFFIX_VERSION");
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future<String> fetchLatestVersion() async {
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.get("$_API_PREFIX$_API_SUFFIX_VERSION");
      return response.data[0];
    } catch (e) {
      print(e);
    }
  }
}
