import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController{
  static CameraPosition? kGooglePlex;
  static Set<Marker> markers = {};

  static findMyLocation() async {
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setMarkerAndMapPosition(position: position);
    return position;
  }

  static setMarkerAndMapPosition({Position? position}) async {
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position.longitude),
      zoom: 17,
    );
    markers.add(Marker(
      markerId: MarkerId(LatLng(position.latitude, position.longitude).toString()),
      position: LatLng(position.latitude, position.longitude),
      infoWindow: const InfoWindow(
        title: 'My Location',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
  }
}

