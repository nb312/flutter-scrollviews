///
/// Created by NieBin on 18-12-15
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import "package:flutter_ui_app/view/common_drawer.dart";
import "package:flutter_ui_app/view/common_drawer.dart";
import "package:flutter_ui_app/view/base_page.dart";
import 'package:flutter_ui_app/const/string_const.dart';
import 'package:flutter_ui_app/const/color_const.dart';
import 'package:flutter_ui_app/const/images_const.dart';
import 'package:flutter_ui_app/const/size_const.dart';

const _SOCIAL_DATA = [
  {
    "title": "Posts",
    "value": "999+",
  },
  {
    "title": "Followers",
    "value": "666+",
  },
  {
    "title": "Comments",
    "value": "444+",
  },
  {
    "title": "Following",
    "value": "22+",
  }
];

class ProfileTwoPage extends StatefulWidget {
  @override
  _ProfileTwoState createState() => _ProfileTwoState();
}

class _ProfileTwoState extends State<ProfileTwoPage> {
  Widget _header() => CircleAvatar(
        backgroundImage: AssetImage(ImagePath.nbImage),
        radius: 56.0,
      );

  Widget _whiteText(content,
      {size = TEXT_NORMAL_SIZE, isBold = false, color = Colors.white}) {
    return Text(
      content,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: isBold ? FontWeight.w700 : null),
    );
  }

  Widget _upper() => Expanded(
        flex: 2,
        child: Container(
          constraints: BoxConstraints.expand(),
          padding: EdgeInsets.all(10.0),
          color: MAIN_COLOR,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _header(),
              _whiteText(StringConst.DEVELOPER, isBold: true),
              _whiteText(StringConst.PROFESSION, size: TEXT_SMALL_SIZE)
            ],
          ),
        ),
      );

  Widget _socialItem(item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _whiteText(item["value"], color: MAIN_COLOR, isBold: true),
        _whiteText(item["title"], color: MAIN_COLOR),
      ],
    );
  }

  Widget _socialRow() {
    var list = List<Widget>();
    for (var item in _SOCIAL_DATA) {
      list.add(_socialItem(item));
    }
    return Expanded(
      flex: 1,
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: list,
        ),
      ),
    );
  }

  Widget _photo() {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _whiteText("Photos", isBold: true, color: MAIN_COLOR),
            Card(
              child: Container(
                constraints: BoxConstraints.expand(height: 60.0),
                foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.cyan.withOpacity(0.3),
                  MAIN_COLOR.withOpacity(0.5)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 1.0, vertical: 5.0),
                      child: Image.asset(
                        ImagePath.paymentImage,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                ),
              ),
              elevation: 4.0,
              shape: Border.all(color: Colors.grey[700], width: 2.0),
            )
          ],
        ),
      ),
    );
  }

  Widget _postPeople() {
    return Container(
      constraints: BoxConstraints.expand(height: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(ImagePath.nbImage),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _whiteText("Nie Bin posted a photo", color: MAIN_COLOR),
                SizedBox(height: 4.0),
                _whiteText("a minute ago", color: MAIN_COLOR),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _post() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _whiteText("Post", isBold: true, color: MAIN_COLOR),
            SizedBox(height: 10.0),
            _postPeople(),
            SizedBox(height: 10.0),
            Expanded(
              child: Container(
                constraints: BoxConstraints.expand(),
                foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.cyan.withOpacity(0.3),
                  MAIN_COLOR.withOpacity(0.5)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                child: Image.asset(
                  ImagePath.blankImage,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.cyan,
        MAIN_COLOR
      ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
      child: Column(
        children: <Widget>[
          _upper(),
          _socialRow(),
          _photo(),
          _post(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: PageConst.profileOneRoute.substring(1),
      hasDrawer: false,
      body: _body(),
    );
  }
}
