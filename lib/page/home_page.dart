///
/// Created by NieBin on 18-12-14
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import 'package:flutter_ui_app/stream/menu_stream.dart';
import 'package:flutter_ui_app/data/Menu.dart';
import 'package:flutter_ui_app/const/string_const.dart';

class HomePage extends StatelessWidget {
  final _scaffoldState = GlobalKey<ScaffoldState>();

  Widget _topBar() => SliverAppBar(
        elevation: 1.0,
        pinned: true,
        title: Text(
          StringConst.APP_NAME,
          style: TextStyle(color: Colors.white),
        ),
      );

  Widget _gridView(List<Menu> list) => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            childAspectRatio: 1.0,
            crossAxisCount: 2),
        delegate: SliverChildBuilderDelegate((context, index) {
          var menu = list[index];
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                menu.image,
                fit: BoxFit.cover,
              ),
              Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
//                    boxShadow: [
//                      BoxShadow(
//                          color: menu.menuColor.withOpacity(0.9),
//                          blurRadius: 10.0)
//                    ],
                  gradient: RadialGradient(
                    colors: [
                      Colors.deepOrange.withOpacity(0.9),
                      Colors.grey[850].withOpacity(0.9)
                    ],
                    radius: 0.3
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        menu.icon,
                        color: Colors.white,
                      ),
                      Text(
                        menu.title,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }, childCount: list.length),
      );

  Widget _streamBuild() {
    var controller = MenuController();
    return StreamBuilder(
      builder: (context, shot) {
        return shot.hasData
            ? CustomScrollView(
                slivers: <Widget>[_topBar(), _gridView(shot.data)],
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
      stream: controller.menuItems,
    );
  }

  Widget _showAndroid(context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: Scaffold(
        key: _scaffoldState,
        body: _streamBuild(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _showAndroid(context);
  }
}
