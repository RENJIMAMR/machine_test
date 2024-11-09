import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreenController with ChangeNotifier {
  var listBox = Hive.box("AssetBox");
  List listKeys = [];
//  var currentList = listBox.get(listKeys[index]);

  void init() {
    listKeys = listBox.keys.toList();
    notifyListeners();
  }
}
