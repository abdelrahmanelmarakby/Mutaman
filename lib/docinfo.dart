import 'package:flutter/material.dart';

import 'color.dart';

class DocInfo extends StatefulWidget {
  @override
  _DocInfoState createState() => _DocInfoState();
}

class _DocInfoState extends State<DocInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/doctor.png',
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Doctor Name',
                    style: TextStyle(
                      color: kRed,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Speicalization',
                    style: TextStyle(
                      color: kRed,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                color: kRed,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: kWhite,
                  ),
                  title: Text(
                    '+20 123 456 7891',
                    style: TextStyle(
                      color: kWhite,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Card(
                color: kRed,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.schedule,
                    color: kWhite,
                  ),
                  title: Text(
                    'Monday',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: kWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
