import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paymentview extends StatefulWidget {
  final DateTime _dateTime;
  final double _duration;

  Paymentview(this._dateTime, this._duration);
  @override
  _PaymentviewState createState() => _PaymentviewState();
}

class _PaymentviewState extends State<Paymentview> {
  final TextEditingController debitCardController = TextEditingController();
  final double cost = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                "Invoice",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    fontSize: 25.0),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Text(
                "Booking for",
                style: TextStyle(
                  color: Colors.blue[900],
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 1,
              shadowColor: Colors.grey[600],
              child: ListTile(
                  leading:
                      Icon(Icons.calendar_today_rounded, color: Colors.blue),
                  title: Text(
                    "${widget._dateTime.day}/${widget._dateTime.month}/${widget._dateTime.year}",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                    ),
                  ),
                  subtitle: Text(
                    "${widget._dateTime.hour} : ${widget._dateTime.minute}",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                    ),
                  ),
                  trailing: Text(
                    "${widget._duration}",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Text(
                "At",
                style: TextStyle(color: Colors.blue[900], fontFamily: 'Roboto'),
              )
            ],
          ),
          Card(
            elevation: 1,
            shadowColor: Colors.grey[600],
            child: ListTile(
              leading: Icon(Icons.location_on, color: Colors.blue),
              title: Text(
                "XYZ mall , sector 12 ",
                style: TextStyle(
                  fontFamily: 'Roboto',
                ),
              ),
              subtitle: Text(""),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Text(
                "Vehicle no.",
                style: TextStyle(
                  color: Colors.blue[900],
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Card(
            elevation: 1,
            shadowColor: Colors.grey[600],
            child: ListTile(
              leading: Icon(Icons.car_repair, color: Colors.blue),
              title: Text(
                "ABCDEF12345",
                style: TextStyle(
                  fontFamily: 'Roboto',
                ),
              ),
              subtitle: Text(""),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Text(
                "Rate",
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
              Card(
                elevation: 1,
                shadowColor: Colors.grey[600],
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text("Rs $cost/hr"),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                "Debit Card No.",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: debitCardController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Enter Debit card no",
              ),
            ),
          ),
          Center(
            child: MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: Text(
                "Pay ${cost * widget._duration}",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
