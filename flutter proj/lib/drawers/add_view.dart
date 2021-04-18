import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> type = [
    "Car",
    "Bike",
  ];

  String dropdownValue = "Car";
  TextEditingController _vehicleNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text('Type'),
              ),
              DropdownButton(
                value: dropdownValue,
                onChanged: (String value) {
                  setState(() {
                    dropdownValue = value;
                  });
                },
                items: type.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              controller: _vehicleNo,
              decoration: InputDecoration(
                labelText: 'Vehicle Number',
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: MaterialButton(
              onPressed: () async {
                // TODO
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
