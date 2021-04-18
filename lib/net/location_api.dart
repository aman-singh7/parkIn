import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Api{
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData locationData;
  CameraPosition userPosition;

  Future<LocationData> getLocation(Location location) async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    locationData = await location.getLocation();
    userPosition = CameraPosition(
      target: LatLng(locationData.latitude, locationData.longitude),
      zoom: 14.767,
    );

    return locationData;
  }
}
