import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paymentview extends StatefulWidget {
  @override
  _PaymentviewState createState() => _PaymentviewState();
}

class _PaymentviewState extends State<Paymentview> {
  final TextEditingController debitCardController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 8.0 , bottom: 8.0),
              child: Text("Payment" , style: TextStyle(fontWeight: FontWeight.bold , fontFamily: 'Roboto' , fontSize: 25.0),),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Text("Booking for" , style: TextStyle(
                color: Colors.blue[900],
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 1,
              shadowColor: Colors.grey[600],
              child: ListTile(
                leading: Icon(Icons.calendar_today_rounded , color: Colors.blue),
                title: Text(
                  "12/12/2022",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                  ),
                ),
                subtitle: Text(
                  "2:00 - 3:00",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                  ),
                ),
                trailing: Text(
                  "1.5 hrs",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Text("At" , style: TextStyle(
                  color: Colors.blue[900],
                  fontFamily: 'Roboto'
              ),)
            ],
          ),
          Card(
            elevation: 1,
            shadowColor: Colors.grey[600],
            child: ListTile(
              leading: Icon(Icons.location_on , color: Colors.blue),
              title: Text(
                "XYZ mall , sector 12 ",
                style: TextStyle(
                  fontFamily: 'Roboto',
                ),
              ),
              subtitle: Text(
                ""
              ),
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
              Text("Vehicle no." , style: TextStyle(
                color: Colors.blue[900],
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),)
            ],
          ),
          Card(
            elevation: 1,
            shadowColor: Colors.grey[600],
            child: ListTile(
              leading: Icon(Icons.car_repair , color: Colors.blue),
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
              Text("Rate" , style: TextStyle(
                color: Colors.blue,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(
                width: 50.0,
              ),
              Card(
                elevation: 1,
                shadowColor: Colors.grey[600],
                child:Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Rs 30/hr"
                  ),
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
            child: RaisedButton(
              color: Colors.blue,
              onPressed: (){

              },
              child: Text("Pay" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontFamily: 'Roboto'),),
              ),
          ),

        ],
      ),
    );
  }
}

