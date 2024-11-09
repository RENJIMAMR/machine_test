import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:machine_test/controller/asset_listing_screen_controller.dart';
import 'package:machine_test/controller/home_screen_controller.dart';
import 'package:machine_test/view/asset_list_adding_screen/asset_list_adding_screen.dart';
import 'package:machine_test/view/home_screen/widget/list_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var listBox = Hive.box("AssetBox");
  // List listKeys = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<HomeScreenController>(context, listen: false).init();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenController>(
      builder: (context, homeProv, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AssetListAddingScreen(),
              ),
            );

            homeProv.init();
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            weight: 20,
            size: 46,
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Center(
                child: Text(
                  'Welcome User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: homeProv.listKeys.length,
                itemBuilder: (context, index) {
                  var currentList =
                      homeProv.listBox.get(homeProv.listKeys[index]);

                  return ListCard(
                    onEDit: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AssetListAddingScreen(
                              itemIndex: index,
                              availability: currentList['availability'] ?? '',
                              name: currentList['name'] ?? "",
                              status: currentList['status'] ?? "",
                              type: currentList['type'] ?? "",
                              des: currentList['des'] ?? "",
                              isEdit: true,
                              serialNo: currentList["serialNo"] ?? "",
                            ),
                          ));
                    },
                    availability: currentList['availability'] ?? "",
                    name: currentList['name'] ?? "",
                    status: currentList['status'] ?? "",
                    type: currentList['type'] ?? "",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
