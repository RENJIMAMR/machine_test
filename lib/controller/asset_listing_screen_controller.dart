import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AssetListingScreenController with ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController serialNumController = TextEditingController();
  TextEditingController availabilityController = TextEditingController();
  TextEditingController borrowerController = TextEditingController();

  var listBox = Hive.box("AssetBox");
  List listKeys = [];
  void init() {
    listKeys = listBox.keys.toList();

    print(listKeys);
  }
}
