import 'champion.dart';
//Map<String,Map> -> Iterable<Map>  ->List<Map>  ->  Iterable<Champion>   ->  List<Champion>
List<Champion> parseChampions(Map<String,dynamic> data){                           //{"Aatrox":{"version":"11.3.1","id":"Aatrox","key":"266","name":"Aatro
  dynamic parsed = data.values; // 불필요한 key 제거. Iterable<Json>형태로      (        {"version":"11.3.1","id":"Aatrox","key":"266","name":"Aatro
  dynamic parsed2 = parsed.toList(); //List<Json> ,                            [        {version: 11.3.1, id: Aatrox, key: 266, name: 아트록스, title: 다르킨의 검
  dynamic parsed3 = parsed2.map<Champion>((item)=>Champion.fromJson(item)); //(Instance of 'Champion', Instance of 'Champion', Instance of 'Champion', ...)
  return parsed3.toList();                                                  //[Instance of 'Champion', Instance of 'Champion', Instance of 'Champion', ...]

}