import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:machine_test/controller/asset_listing_screen_controller.dart';
import 'package:machine_test/view/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

class AssetListAddingScreen extends StatefulWidget {
  const AssetListAddingScreen(
      {super.key,
      this.itemIndex = 0,
      this.isEdit = false,
      this.name,
      this.type,
      this.availability,
      this.des,
      this.serialNo,
      this.status});
  final bool isEdit;
  final int itemIndex;

  final String? name, type, availability, des, serialNo, status;
  @override
  State<AssetListAddingScreen> createState() => _AssetListAddingScreenState();
}

class _AssetListAddingScreenState extends State<AssetListAddingScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController serialNumController = TextEditingController();
  TextEditingController availabilityController = TextEditingController();
  TextEditingController borrowerController = TextEditingController();

  @override
  void initState() {
    if (widget.isEdit) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          Provider.of<AssetListingScreenController>(context, listen: false)
              .init();
        },
      );
      nameController.text = widget.name ?? '';
      typeController.text = widget.type ?? '';
      desController.text = widget.des ?? "";
      serialNumController.text = widget.serialNo ?? "";

      availabilityController.text = widget.availability ?? "";
      borrowerController.text = widget.status ?? "";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AssetListingScreenController>(
      builder: (context, assetProv, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink.shade100,
          child: Icon(
            Icons.check,
            color: Colors.white,
            weight: 30,
            size: 40,
          ),
          onPressed: () {
            if (formkey.currentState!.validate()) {
              widget.isEdit == true
                  ? assetProv.listBox
                      .put(assetProv.listKeys[widget.itemIndex], {
                      "name": nameController.text,
                      "type": typeController.text,
                      "des": desController.text,
                      "serialNo.": serialNumController.text,
                      "availability": availabilityController.text,
                      "status": borrowerController.text
                    })
                  : assetProv.listBox.add({
                      "name": nameController.text,
                      "type": typeController.text,
                      "des": desController.text,
                      "serialNo.": serialNumController.text,
                      "availability": availabilityController.text,
                      "status": borrowerController.text
                    });
              setState(() {});

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            }
          },
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Name : ',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "Field Can't be Empty";
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter asset name here',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.9)),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Type : ',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: typeController,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "Field Can't be Empty";
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter type of asset',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.9)),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Description : ',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: desController,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "Field Can't be Empty";
                    }
                  },
                  maxLines: 10,
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter description',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.9)),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Serial Number : ',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: serialNumController,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "Field Can't be Empty";
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter serial number',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.9)),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Availability : ',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: availabilityController,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "Field Can't be Empty";
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter availability status',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.9)),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Borrower status : ',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: borrowerController,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "Field Can't be Empty";
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter borrower status',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.9)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
