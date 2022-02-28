import 'package:flutter/material.dart';

import 'location_field.dart';

// return bars widgets
Widget sreachBarWidget(TextEditingController sourceController,
    TextEditingController destinationController) {
  return Card(
    elevation: 5,
    clipBehavior: Clip.antiAlias,
    margin: const EdgeInsets.all(0),
    child: Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                SreachLocationField(
                    isDestination: false,
                    textEditingController: sourceController),
                SreachLocationField(
                    isDestination: true,
                    textEditingController: destinationController),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
