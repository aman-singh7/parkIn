import 'dart:core';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Markers{
  Marker marker;
  String destination;
  bool isFavourite;
  double cost;
  Markers(this.marker , this.destination , this.isFavourite , this.cost);
}
