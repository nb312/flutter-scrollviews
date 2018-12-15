import 'package:flutter/material.dart';
import 'package:flutter_ui_app/page/home_page.dart';
import 'const/string_const.dart';
import 'package:flutter_ui_app/page/pages.dart';
import 'const/color_const.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConst.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: MAIN_COLOR,
      ),
      home: HomePage(),
      routes: {
        PageConst.profileOneRoute: (context) => ProfileOnePage(),
        PageConst.profileTwoRoute: (context) => ProfileTwoPage(),
      },
      onUnknownRoute: (setting) =>
          MaterialPageRoute(builder: (context) => EmptyPage()),
    );
  }
}
