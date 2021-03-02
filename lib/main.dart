import 'package:flutter/material.dart';
import 'package:limitless_oasis/screen/map_screen.dart';
import 'package:limitless_oasis/screen/pick_menu_screen.dart';
import 'package:limitless_oasis/screen/pick_screen.dart';

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

    return pick_menu_screen();
//    return map_screen(screen_width,screen_height);
//    return pick_screen(screen_width,screen_height);
  }


}
