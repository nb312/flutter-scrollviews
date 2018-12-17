///
/// Created by NieBin on 18-12-15
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import 'package:flutter_ui_app/view/base_page.dart';
import 'package:flutter_ui_app/const/string_const.dart';
import 'package:flutter_ui_app/const/images_const.dart';
import 'package:flutter_ui_app/const/size_const.dart';
import 'package:flutter_ui_app/const/color_const.dart';

class ProfileOnePage extends StatefulWidget {
  @override
  _ProfileOneState createState() => _ProfileOneState();
}

const _NAME_ = "NieBin";
const _PROFESSION_ = "Flutter Developer";
const _SOCIAL_DATA = [
  ["Posts", "999+"],
  ["Followers", "1999999+"],
  ["Comments", "888+"],
  ["Following", "666+"],
];
const _DESC =
    "Google Developer Expert for Flutter in the future. Passionate #Flutter, #Android Developer. #Entrepreneur, #Kotlin";
const _ACCOUNT_ADDRESS = [
  ["Github", "github.com/nb312"],
  ["Location", "ShangHai/China"],
  ["Phone", "+8612345678901"],
  ["Email", "niebin312@gmail.com"],
  ["Facebook", "fb.com/Nie Bin"],
  ["Website", "github.com/nb312"],
];

class _ProfileOneState extends State<ProfileOnePage> {
  double deviceH;

  Widget _titleWhite(text, {size = TEXT_NORMAL_SIZE, isB = false}) => Text(
        text,
        style: TextStyle(
            color: Colors.grey[900],
            fontSize: size,
            fontWeight: isB ? FontWeight.w700 : null),
      );

  Widget _header() => Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        constraints: BoxConstraints.expand(height: deviceH * 0.25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _titleWhite(_NAME_, isB: true),
            _titleWhite(_PROFESSION_, size: TEXT_SMALL_SIZE),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message,
                    color: MAIN_COLOR,
                  ),
                ),
                SizedBox(width: 4.0),
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage(ImagePath.nbImage),
                ),
                SizedBox(width: 4.0),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.phone,
                    color: MAIN_COLOR,
                  ),
                )
              ],
            )
          ],
        ),
      );

  Widget _columnItem(first, second) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _titleWhite(
          first,
          isB: true,
        ),
        _titleWhite(second),
      ],
    );
  }

  Widget _accountItem(index) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _columnItem(_ACCOUNT_ADDRESS[index][0], _ACCOUNT_ADDRESS[index][1]),
          _columnItem(
              _ACCOUNT_ADDRESS[index + 1][0], _ACCOUNT_ADDRESS[index + 1][1]),
        ],
      ),
    );
  }

  Widget _accountText() {
    return Container(
        constraints: BoxConstraints.expand(height: deviceH * 0.3),
        alignment: AlignmentDirectional.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _accountItem(0),
            _accountItem(2),
            _accountItem(4),
          ],
        ));
  }

  Widget _describeText() => Container(
        alignment: AlignmentDirectional.center,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        constraints: BoxConstraints.expand(height: deviceH * 0.12),
        child: _titleWhite(_DESC),
      );

  Widget _socialDatum() {
    var list = List<Widget>();
    for (var single in _SOCIAL_DATA) {
      list.add(_columnItem(single[1], single[0]));
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      constraints: BoxConstraints.expand(height: deviceH * 0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: list,
      ),
    );
  }

  Widget _diver() {
    return Divider(
      color: MAIN_COLOR,
    );
  }

  @override
  Widget build(BuildContext context) {
    deviceH = MediaQuery.of(context).size.height;
    return BasePage(
      title: PageConst.profileOneRoute.substring(1),
      bottomIcon: Icons.group_add,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.cyan, MAIN_COLOR.withOpacity(0.8)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _header(),
              _diver(),
              _socialDatum(),
              _diver(),
              _describeText(),
              _diver(),
              _accountText()
            ],
          ),
        ),
      ),
    );
  }
}
