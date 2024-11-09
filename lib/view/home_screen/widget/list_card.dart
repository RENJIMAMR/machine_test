// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:machine_test/view/asset_list_adding_screen/asset_list_adding_screen.dart';

class ListCard extends StatelessWidget {
  const ListCard(
      {super.key,
      required this.name,
      required this.type,
      required this.availability,
      required this.status,
      this.onEDit});
  final String name, type, availability, status;
  final void Function()? onEDit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        color: Colors.pink.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name: ",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      name,
                      style: TextStyle(color: Colors.black, fontSize: 19),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      type,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Availability: ",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      availability,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Status: ",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      status,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: onEDit,
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
