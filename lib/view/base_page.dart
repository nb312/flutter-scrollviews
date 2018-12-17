///
/// Created by NieBin on 18-12-17
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import 'package:flutter_ui_app/view/common_drawer.dart';

class BasePage extends StatelessWidget {
  final String title;
  final Widget body;
  final IconData bottomIcon;
  final bool hasDrawer;

  BasePage({this.title, this.body, this.bottomIcon, this.hasDrawer = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          )
        ],
      ),
      body: body,
      floatingActionButton: bottomIcon == null
          ? null
          : FloatingActionButton(
              onPressed: () {},
              child: Icon(bottomIcon),
            ),
      drawer: this.hasDrawer
          ? CommonDrawer(
              context: context,
              title: title,
            )
          : null,
    );
  }
}
