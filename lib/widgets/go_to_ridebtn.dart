import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_starter_pack/helpers/mapbox_handler.dart';
import 'package:mapbox_starter_pack/helpers/shared_prefs.dart';

import '../screens/review_ride.dart';

Widget GoToRideBtn(BuildContext context) {
  return FloatingActionButton.extended(
      onPressed: () async {
        // Get directions API response and pass to modified response
        LatLng sourceLatLng = getTripLatLngFromSharedPrefs('source');
        LatLng destinationLatLng = getTripLatLngFromSharedPrefs('destination');
        Map modifiedResponse =
            await getDirectionsAPIResponse(sourceLatLng, destinationLatLng);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>
                    ReviewRide(modifiedResponse: modifiedResponse)));
      },
      label: const Text('C\'est partis !'));
}
