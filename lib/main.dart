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
        PageConst.shoppingOneRoute: (context) => ShopOnePage(),
        PageConst.shoppingTwoRoute: (context) => ShopTwoPage(),
        PageConst.shoppingThreeRoute: (context) => ShopThreePage(),
        PageConst.loginOneRoute: (context) => LoginOnePage(),
        PageConst.loginTwoRoute: (context) => LoginTwoPage(),
        PageConst.timelineOneRoute: (context) => TimeOnePage(),
        PageConst.timelineTwoRoute: (context) => TimeTwoPage(),
        PageConst.dashboardOneRoute: (context) => DashOnePage(),
        PageConst.dashboardTwoRoute: (context) => DashTwoPage(),
        PageConst.settingsOneRoute: (context) => SettingOnePage(),
        PageConst.notFoundRoute: (context) => NoResultPage(),
        PageConst.paymentOneRoute: (context) => PayOnePage(),
        PageConst.paymentTwoRoute: (context) => PayTwoPage(),
      },
      onUnknownRoute: (setting) =>
          MaterialPageRoute(builder: (context) => EmptyPage()),
    );
  }
}
