import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Updated_Card extends StatefulWidget {
  @override
  _Updated_CardState createState() => _Updated_CardState();
}

class _Updated_CardState extends State<Updated_Card> {
  @override
  Widget build(BuildContext context) {
    var dropdownValue = 'One';
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 110),
          child: Text(
            'Weather Card',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Card(
        color: Colors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text('Tuseday 28'),
                        IconButton(
                            icon: Icon(
                              Icons.arrow_drop_down_circle_outlined,
                            ),
                            onPressed: null)
                      ],
                    ),
                  ),
                  Text('Mostly Sunny'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('29*c',
                  style: TextStyle(
                    fontSize: 64,
                  ),
                  ),
                  Icon(
                    Icons.wb_sunny,
                    size: 78,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('17*c/31*c'),
                    Text('Wind 13 km/hr'),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
