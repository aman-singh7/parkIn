import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:login_app/Model/MarkerModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'home_view.dart';
import 'dart:ui';
import 'payment.dart';

class Bottomsheet extends StatefulWidget {
  final bool isVisible;
  Markers markers = HomeVeiwState.currentMarker;
  Bottomsheet(this.isVisible);
  @override
  _BottomsheetState createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  static double duration = 0.5;
  DateTime datetime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: DraggableScrollableSheet(
          initialChildSize: 0.30,
          maxChildSize: 0.96,
          minChildSize: 0.30,
          builder: (context, _controller2) {
            return Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[700],
                      offset: Offset(0.5, 0.5),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: ListView(
                controller: _controller2,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: SizedBox(
                        width: 100.0,
                        height: 4.0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        "${widget.markers.destination}",
                        style: TextStyle(
                            color: Colors.blue[700],
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      IconButton(icon: widget.markers.isFavourite ? Icon(Icons.star) : Icon(Icons.star_border),
                          color:  widget.markers.isFavourite ? Colors.yellow : null ,
                          onPressed: (){
                              setState(() {
                                    widget.markers.isFavourite = !widget.markers.isFavourite;
                              });
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        "300m",
                        style: TextStyle(
                            color: Colors.grey[600], fontFamily: 'Roboto'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(
                      "Near XYZ Mall",
                      style: TextStyle(
                          color: Colors.grey[600], fontFamily: 'Roboto'),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(
                      "0123456789",
                      style: TextStyle(
                          color: Colors.grey[600], fontFamily: 'Roboto'),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Booking for",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Roboto',
                        ),
                      )
                    ],
                  ),
                  ListTile(
                    title: Text(
                      "${datetime.year}-${datetime.month}-${datetime.day}   ${datetime.hour} : ${datetime.minute}",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.calendar_today_rounded,
                          color: Colors.blue,
                        ),
                        onPressed: () async {
                          final selectedDate = await pickDate();
                          if (selectedDate == null) {
                            return;
                          }
                          final selectedTime = await pickTime();
                          if (selectedTime == null) {
                            return;
                          }
                          setState(() {
                            datetime = DateTime(
                              selectedDate.year,
                              selectedDate.month,
                              selectedDate.day,
                              selectedTime.hour,
                              selectedTime.minute,
                            );
                          });
                        }),
                  ),
                  ListTile(
                    leading: Icon(Icons.timer),
                    title: Text("Duration"),
                    subtitle: Text(
                      "$duration hrs",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.add, color: Colors.blue),
                      onPressed: () {
                        setState(() {
                          duration += 0.5;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Choose vehicle",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto'),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.black,
                        size: 30.0,
                      ),
                      onPressed: null,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Available Slots",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.red[200],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Roboto',
                                fontSize: 18,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "100 ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                TextSpan(text: "Slots Already Booked")
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.green[200],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                color: Colors.green,
                                fontFamily: 'Roboto',
                                fontSize: 18,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "150 ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                TextSpan(text: "Slots Available")
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 16.0, bottom: 32.0),
                    child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Paymentview(datetime, duration),
                            ),
                          );
                        },
                        elevation: 10.0,
                        color: Colors.blue[900],
                        padding: EdgeInsets.all(18.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                          child: Text(
                            "BOOK",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            );
          }),
    );
  }

  Future<DateTime> pickDate() {
    Future<DateTime> date = showDatePicker(
      context: context,
      initialDate: datetime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 7)),
    );
    return date;
  }

  Future<TimeOfDay> pickTime() {
    Future<TimeOfDay> time = showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: datetime.hour, minute: datetime.minute),
    );
    return time;
  }
}
