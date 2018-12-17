///
/// Created by NieBin on 18-12-17
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import 'package:flutter_ui_app/const/string_const.dart';
import 'package:flutter_ui_app/const/images_const.dart';
import 'package:flutter_ui_app/const/size_const.dart';
import 'AboutMeTitle.dart';

const ITEMS = [
  {
    "title": PageConst.profileOneRoute,
    "color": Colors.blue,
    "icon": Icons.person
  },
  {
    "title": PageConst.shoppingOneRoute,
    "color": Colors.green,
    "icon": Icons.shopping_cart
  },
  {
    "title": PageConst.dashboardOneRoute,
    "color": Colors.red,
    "icon": Icons.dashboard
  },
  {
    "title": PageConst.timelineOneRoute,
    "color": Colors.cyan,
    "icon": Icons.timeline
  },
  {
    "title": PageConst.settingsOneRoute,
    "color": Colors.brown,
    "icon": Icons.settings
  },
];

@immutable
class CommonDrawer extends StatelessWidget {
  CommonDrawer({this.context, this.title});

  final String title;
  final BuildContext context;

  Widget _item(context, item) => ListTile(
        title: Text(
          item["title"],
          style: TextStyle(
              color: Colors.grey[900],
              fontWeight: FontWeight.w700,
              fontSize: TEXT_NORMAL_SIZE),
        ),
        leading: Icon(
          item["icon"],
          color: item["color"],
        ),
        onTap: () {
          var isEqual = item["title"] == title;
          if (isEqual || this.context == null) return;
          var pageName = "/${item["title"]}";
          Navigator.pop(context);
          Navigator.pop(this.context);
          Navigator.pushNamed(context, pageName);
        },
      );

  Widget _header() => UserAccountsDrawerHeader(
        currentAccountPicture: CircleAvatar(
          backgroundImage: AssetImage(ImagePath.nbImage),
        ),
        accountName: Text(StringConst.DEVELOPER),
        accountEmail: Text(StringConst.DEV_EMAIL),
      );

  @override
  Widget build(BuildContext context) {
    var list = List<Widget>();
    list.add(_header());
    for (var item in ITEMS) {
      list.add(_item(context, item));
    }
    list.add(AboutMeTitle());
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: list,
      ),
    );
  }
}
