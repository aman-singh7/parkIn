import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:login_app/drawers/my_vehicle.dart';
import 'package:login_app/net/firebase.dart';
import 'package:provider/provider.dart';
import 'Bottomsheet.dart';
import 'package:login_app/net/location_api.dart';

class HomeVeiw extends StatefulWidget {
  @override
  _HomeVeiwState createState() => _HomeVeiwState();
}

class _HomeVeiwState extends State<HomeVeiw> {
  StreamSubscription<LocationData> streamSubscription;
  Marker marker;
  static bool isVisible = false;
  static String destination = "";
  List<Marker> markers;
  GoogleMapController _controller;
  Api api = Api();

  List<Marker> getMarker(){
    return [
      Marker(
          markerId: MarkerId("1"),
          position: LatLng(25.224959546190142, 84.99172023136182),
          onTap: (){
            setState(() {
              destination = "XYZ Mall, Sector 12";
              isVisible = true;
            });
          },
          infoWindow: InfoWindow(
            title: '1',
          )
      ),
      Marker(
          markerId: MarkerId("2"),
          position: LatLng(25.22556198253419, 84.99364670346958),
          onTap: (){
            setState(() {
              destination = "parking 2";
              isVisible = true;
            });
          },
          infoWindow: InfoWindow(
            title: '2',
          )
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    markers = getMarker();
    Location location = Location();
    streamSubscription = location.onLocationChanged.listen((locationData){
      if(mounted){
        setState(() {
          api.locationData = locationData;
        });
      }
    });
    return Scaffold(
      appBar: AppBar(
           title: Text(
             "ParkIn",
           ),
        actions: [
          IconButton(icon: Icon(Icons.search , color: Colors.white,), onPressed: null),
        ],
          ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                /*image: DecorationImage(
                  image: AssetImage('assets/images/profile.png'),
                  
                ),*/
              ),
              child: Row(
                children: [
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.car_rental),
              title: Text("My Vehicle"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyVehicle(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book_outlined),
              title: Text('My Booking'),
            ),
            ListTile(
              leading: Icon(Icons.star_border),
              title: Text("Favourites"),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sign Out"),
              onTap: () {
                context.read<FlutterFireAuthService>().signOut(context);
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children : <Widget>[
          FutureBuilder<LocationData> (
            future : api.getLocation(location),
            builder: (BuildContext context, AsyncSnapshot<LocationData> snapshot) {
              if(snapshot.data == null ){
                return Container(
                  color : Colors.grey[400],
                );
              }
              else{
                marker = Marker(
                  markerId: MarkerId("home"),
                  infoWindow: InfoWindow(
                    title: "home",
                    snippet: "current location",
                  ),
                  onTap: (){
                    destination = "home";
                    isVisible = true;
                  },
                  position: LatLng( api.locationData.latitude , api.locationData.longitude),
                  icon: BitmapDescriptor.defaultMarkerWithHue(0.0),
                );
                markers.add(marker);
                return GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: api.userPosition,
                  markers: markers.toSet(),
                  onMapCreated: (controller) {
                    _controller = controller;
                  },
                );
              }
            },
          ),
          Bottomsheet(destination , isVisible),
        ],
      ),
    );
  }

  void dispose(){
    if ( streamSubscription != null){
      streamSubscription.cancel();
    }
    if( markers != null ){
      markers.remove(marker);
    }
    super.dispose();
  }
}