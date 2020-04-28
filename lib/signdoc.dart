import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mutaman/doctors.dart';

import 'color.dart';

class SignDoctor extends StatefulWidget {
  @override
  _SignDoctorState createState() => _SignDoctorState();
}

class _SignDoctorState extends State<SignDoctor> {
  @override
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController Specialization = TextEditingController();

  login(BuildContext context) async {
    List data = await loginn(name.text, email.text, password.text, phone.text,
        Specialization.text, dropval);
    print(data);
    if (data.length != 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Doctors()));
    } else {
      print("false");
    }
  }

  Future loginn(String name, String email, String password, String phone,
      String Specialization, String val) async {
    String url = "http://192.168.1.13/Mutaman/insertDoctor.php";

    http.Response response = await http.post(url, body: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'specialization': Specialization,
      'date': dropval,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      return json.encode(response.body);
    }
  }

  Map<String, dynamic> map;
  List<dynamic> data;
  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("http://192.168.1.11/cleanpoint/index.php"),
        headers: {"Accept": "application/json"});
    setState(() {
      map = json.decode(response.body);
      data = data[0];
    });
    print(response.statusCode);
    print(data[1]["id"]);

    return "0";
  }

  String dropval;
  void dropChange(String val) {
    setState(() {
      dropval = val;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
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
                height: 10,
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
                height: 10,
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
                height: 10,
              ),
              TextFormField(
                controller: Specialization,
                decoration: new InputDecoration(
                  labelText: 'Specialization',
                  icon: Icon(
                    Icons.local_hospital,
                    size: 30,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: DropdownButton(
                  hint: Text(
                    'Please Select your Day',
                  ),
                  icon: Icon(Icons.calendar_today),
                  onChanged: dropChange,
                  isExpanded: true,
                  underline: Text(''),
                  value: dropval,
                  items: <String>[
                    'Monday',
                    'Tuesday',
                    'Wednesday',
                    'Thursday',
                    'Friday',
                    'Saturday',
                    'Sunday'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 10,
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
                height: 10,
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
                height: 10,
              ),
              TextFormField(
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
                height: 10,
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
                  login(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Doctors();
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
