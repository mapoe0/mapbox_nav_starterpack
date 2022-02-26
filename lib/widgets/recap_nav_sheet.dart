import 'package:flutter/material.dart';
import 'package:mapbox_starter_pack/helpers/shared_prefs.dart';

import '../screens/navigation.dart';

Widget recapNavSheet(
    BuildContext context, String distance, String dropOffTime) {
  // Get source and destination addresses from sharedPreferences
  String sourceAddress = getSourceAndDestinationPlaceText('source');
  String destinationAddress = getSourceAndDestinationPlaceText('destination');

  return Positioned(
    bottom: 0,
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('$sourceAddress ➡ $destinationAddress',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.black)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    tileColor: Colors.grey[200],
                    leading: const Icon(
                      Icons.navigation_rounded,
                      color: Colors.black,
                    ),
                    title: Text(
                      '$distance km, $dropOffTime drop off',
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const TurnByTurn())),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Start navigation'),
                        ])),
              ]),
        ),
      ),
    ),
  );
}
