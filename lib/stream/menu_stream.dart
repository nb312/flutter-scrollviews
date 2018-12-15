///
/// Created by NieBin on 18-12-15
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter_ui_app/data/Menu.dart";
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ui_app/const/images_const.dart';

///ToDo need international.
const _MENU_STRINGS = [
  {
    'title': "Profile",
    'items': ["View Profile", "Profile 2", "Profile 3", "Profile 4"]
  },
  {
    'title': "Shopping",
    'items': [
      "Shopping List",
      "Shopping Details",
      "Product Details",
      "Shopping 4"
    ]
  },
  {
    'title': "Login",
    'items': ["Login With OTP", "Login 2", "Sign Up", "Login 4"],
  },
  {
    'title': "Timeline",
    'items': ["Feed", "Tweets", "Timeline 3", "Timeline 4"],
  },
  {
    'title': "Dashboard",
    'items': ["Dashboard 1", "Dashboard 2", "Dashboard 3", "Dashboard 4"],
  },
  {
    'title': "Settings",
    'items': ["Device Settings", "Settings 2", "Settings 3", "Settings 4"],
  },
  {
    'title': "No Item",
    'items': ["No Search Result", "No Internet", "No Item 3", "No Item 4"],
  },
  {
    'title': "Payment",
    'items': ["Credit Card", "Payment Success", "Payment 3", "Payment 4"],
  },
];
const _MENU_COLORS = [
  0xff050505,
  0xffc8c4bd,
  0xffc7d8f4,
  0xff7f5741,
  0xff261d33,
  0xff2a8ccf,
  0xffe19b6b,
  0xffe19b6b,
  0xffddcec2
];
const _MENU_ICONS = [
  Icons.person,
  Icons.shopping_cart,
  Icons.send,
  Icons.timeline,
  Icons.dashboard,
  Icons.settings,
  Icons.not_interested,
  Icons.payment,
];
const _IMAGE_PATHS = [
  ImagePath.shoppingImage,
  ImagePath.profileImage,
  ImagePath.loginImage,
  ImagePath.timelineImage,
  ImagePath.dashboardImage,
  ImagePath.settingsImage,
  ImagePath.blankImage,
  ImagePath.paymentImage,
];

class MenuController {
  final controller = StreamController<List<Menu>>();

  Stream<List<Menu>> get menuItems => controller.stream;

  MenuController({List<Menu> menus}) {
    controller.add(menus ?? _defaultMenus());
  }

  static String _title(index) {
    return _MENU_STRINGS[index % _MENU_STRINGS.length]['title'];
  }

  static List<String> _items(index) {
    return _MENU_STRINGS[index % _MENU_STRINGS.length]['items'];
  }

  List<Menu> _defaultMenus() {
    var list = List<Menu>();
    for (int i = 0; i < _MENU_STRINGS.length; i++) {
      list.add(Menu(
          title: _title(i),
          icon: _MENU_ICONS[i],
          menuColor: Color(_MENU_COLORS[i]),
          image: _IMAGE_PATHS[i],
          items: _items(i)));
    }
    return list;
  }
}
