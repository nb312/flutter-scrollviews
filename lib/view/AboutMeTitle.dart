///
/// Created by NieBin on 18-12-17
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import 'package:flutter_ui_app/const/string_const.dart';

class AboutMeTitle extends AboutListTile {
  AboutMeTitle()
      : super(
          icon: FlutterLogo(),
          applicationName: StringConst.APP_NAME,
          applicationVersion: "1.0.1",
          applicationLegalese: "Apache License 2.0",
        );
}
