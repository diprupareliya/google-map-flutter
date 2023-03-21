import 'package:flutter/material.dart';
import 'package:google_map_flutter/controller/find_my_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  void initState() {
    () async {
      await LocationController.findMyLocation();
      setState(() {});
    }();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map"),
      ),
      body: LocationController.kGooglePlex != null
          ? GoogleMap(
              mapType: MapType.normal,
              markers: LocationController.markers,
              initialCameraPosition: LocationController.kGooglePlex!,
              buildingsEnabled: true,
              zoomControlsEnabled: false,
              trafficEnabled: true,
              onMapCreated: (GoogleMapController controller) {},
            )
          : const Center(
              child: Text(
                "Near by store not available",
              ),
            ),
    );
  }
}
