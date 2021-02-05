class Champion{
  String version;
  String id;
  String key;
  String name;
  String title;
  String blurb;
  Map<String, dynamic> info;
  Map<String, dynamic> image;
  List<dynamic> tags;
  String partype;
  Map<String, dynamic> stats;//double, int

  Champion({this.version,this.id,this.key,this.name,this.title,this.blurb,this.info,this.image,this.tags,this.partype,this.stats});

  factory Champion.fromJson(Map<String,dynamic> json){
    return Champion(
      version: json['version'],
      id: json['id'],
      key: json['key'],
      name: json['name'],
      title: json['title'],
      blurb: json['blurb'],
      info: json['info'],
      image: json['image'],
      tags: json['tags'],
      partype: json['partype'],
      stats: json['stats'],
    );
  }
}