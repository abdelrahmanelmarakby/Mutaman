import 'package:flutter/material.dart';
import 'package:mutaman/signdoc.dart';
import 'color.dart';
import 'sign.dart';

class Select extends StatefulWidget {
  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select to Sign'),
        backgroundColor: kRed,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ListView(
            children: <Widget>[
              Image.asset(
                'images/logo.png',
                height: 200,
              ),
              Padding(
                padding: EdgeInsets.only(left: 200, right: 200),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                child: Text('Please Select if you',
                    style: TextStyle(fontSize: 20, color: kRed)),
                onPressed: () {},
              ),
              GestureDetector(
                child: Card(
                  color: kRed,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        'Patient',
                        style: TextStyle(
                          color: kWhite,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Sign();
                      },
                    ),
                  );
                },
              ),
              FlatButton(
                child: Text('OR', style: TextStyle(fontSize: 20, color: kRed)),
                onPressed: () {},
              ),
              GestureDetector(
                child: Card(
                  color: kRed,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        'Doctor',
                        style: TextStyle(
                          color: kWhite,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignDoctor();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
