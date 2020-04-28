import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'color.dart';
import 'doctors.dart';

class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController confirmpassword = TextEditingController();
validator(String string) {
  if (confirmpassword == password)
    return "error";
  else {
    string = "error";
  }
}

login(BuildContext context) async {
  List data = await loginn(name.text, email.text, password.text, phone.text);
  print(data);
  if (data.length != 0) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Doctors()));
  } else {
    print("false");
  }
}

Future loginn(String name, String email, String password, String phone) async {
  String url = "http://192.168.1.13/Mutaman/insertpatient.php";

  http.Response response = await http.post(url, body: {
    'name': name,
    'email': email,
    'password': password,
    'phone': phone
  });
  print(response.statusCode);
  if (response.statusCode == 200) {
    return json.encode(response.body);
  }
}

class _SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,*/
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: kRed,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              Image.asset(
                'images/logo.png',
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: name,
                decoration: new InputDecoration(
                  labelText: 'User Name',
                  icon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: email,
                decoration: new InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    Icons.email,
                    size: 30,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  labelText: 'Phone Number',
                  icon: Icon(
                    Icons.call,
                    size: 30,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: password,
                decoration: new InputDecoration(
                  labelText: 'Password',
                  icon: Icon(
                    Icons.lock_outline,
                    size: 30,
                  ),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: validator(confirmpassword.text),
                controller: confirmpassword,
                decoration: new InputDecoration(
                  labelText: 'Confirm Password',
                  icon: Icon(
                    Icons.lock,
                    size: 30,
                  ),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Card(
                  color: kRed,
                  margin: EdgeInsets.only(
                    left: 45,
                    top: 10,
                  ),
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
                onTap: () async {
                  if (password.text == confirmpassword.text &&
                      phone.text.length == 11 &&
                      email.text.contains('@', 0) &&
                      email.text.contains('.com', 0)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          {
                            login(context);
                          }
                          return Doctors();
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
