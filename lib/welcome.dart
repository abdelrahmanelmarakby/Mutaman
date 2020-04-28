import 'package:flutter/material.dart';
import 'package:mutaman/select.dart';

import 'color.dart';
import 'login.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRed,
        title: Center(child: Text("Mutaman")),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  'images/logo.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 200, right: 200),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                child: Text(
                  'We Care  ^_^ ',
                  style: TextStyle(fontSize: 20, color: kRed),
                ),
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
                        'Login',
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
                        return Login();
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              GestureDetector(
                child: Card(
                  color: kRed,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        'Sign Up',
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
                        return Select();
                      },
                    ),
                  );
                },
              ),
              RaisedButton(
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
