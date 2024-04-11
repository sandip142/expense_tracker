import 'package:flutter/cupertino.dart';

String iconDataToString(IconData iconData) {
  return iconData.codePoint.toString();
}

IconData stringToIconData(String iconString) {
  return IconData(int.parse(iconString), fontFamily: 'MaterialIcons');
}
