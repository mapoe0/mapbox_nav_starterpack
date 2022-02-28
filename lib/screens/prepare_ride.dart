import 'package:flutter/material.dart';
import 'package:mapbox_starter_pack/widgets/sreach_widgets.dart';
import 'package:mapbox_starter_pack/widgets/search_listview.dart';

import '../widgets/go_to_ridebtn.dart';

class PrepareRide extends StatefulWidget {
  const PrepareRide({Key? key}) : super(key: key);

  @override
  State<PrepareRide> createState() => _PrepareRideState();

  // Declare a static function to reference setters from children
  static _PrepareRideState? of(BuildContext context) =>
      context.findAncestorStateOfType<_PrepareRideState>();
}

class _PrepareRideState extends State<PrepareRide> {
  bool isLoading = false;
  bool isEmptyResponse = true;
  bool hasResponded = false;
  bool isResponseForDestination = false;

  String noRequest = 'Taper pour chercher un résultat';
  String noResponse = 'Aucun Résultat';

  List responses = [];
  TextEditingController sourceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  // Define setters to be used by children widgets
  set responsesState(List responses) {
    setState(() {
      this.responses = responses;
      hasResponded = true;
      isEmptyResponse = responses.isEmpty;
    });
    Future.delayed(
      const Duration(milliseconds: 500),
      () => setState(() {
        isLoading = false;
      }),
    );
  }

  set isLoadingState(bool isLoading) {
    setState(() {
      this.isLoading = isLoading;
    });
  }

  set isResponseForDestinationState(bool isResponseForDestination) {
    setState(() {
      this.isResponseForDestination = isResponseForDestination;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          "Recherche un itinéraire",
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              sreachBarWidget(sourceController, destinationController),
              // Add a Linear Progress Indicator to show loading under the sreach section
              isLoading
                  ? const LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : Container(),
              // Show an appropriate message if no address has been entered, or no results are found
              isEmptyResponse
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                          child: Text(
                        hasResponded ? noResponse : noRequest,
                      )))
                  : Container(),
              // Show a list view of results to select one from
              searchListView(responses, isResponseForDestination,
                  destinationController, sourceController),
            ],
          ),
        ),
      ),
      floatingActionButton: GoToRideBtn(context),
    );
  }
}
