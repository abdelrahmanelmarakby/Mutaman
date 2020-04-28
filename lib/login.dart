import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mutaman/doctors.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final TextEditingController name = new TextEditingController();
final TextEditingController password = new TextEditingController();

class _LoginState extends State<Login> {
  /*check() {
    if (username.text.trim().isNotEmpty && password.text.trim().isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Doctors();
          },
        ),
      );
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text(
                'Cleanpoint',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.green),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
            ),
            body: Container(
                color: Colors.white,
                child: Center(
                    child: ListView(shrinkWrap: true, children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset('images/doctor.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 60, right: 60, bottom: 30, top: 20),
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          fillColor: Colors.green,
                          filled: true,
                          labelText: '     email',
                          labelStyle: TextStyle(color: Colors.black54)),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 60, right: 60, bottom: 30),
                    child: TextFormField(
                      obscureText: true,
                      controller: password,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          fillColor: Colors.green,
                          filled: true,
                          labelText: '     Password',
                          labelStyle: TextStyle(color: Colors.black54)),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 60,
                      right: 60,
                      bottom: 30,
                    ),
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: () async {
                        login();
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ])))));

    /* Scaffold(
//      resizeToAvoidBottomInset: false,
//      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: kRed,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/logo.png',
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 30,
                width: 30,
              ),
              TextFormField(
                controller: username,
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
                height: 30,
                width: 30,
              ),
              TextFormField(
                controller: password,
                // onSaved: ,
                decoration: new InputDecoration(
                  labelText: 'Password',
                  icon: Icon(
                    Icons.lock,
                    size: 30,
                  ),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(onPressed: () async {
                Login();
              })

              /*GestureDetector(
                child: Card(
                  color: kRed,
                  margin: EdgeInsets.only(
                    left: 45,
                    top: 10,
                  ),
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
                onTap: () async {
                  Login();
                  print('pressed');
                },
              ),*/
              ,
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 140),
                child: Text(
                  'Forget Password !',
                  style: TextStyle(fontSize: 15, color: kRed),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List> login() async {
    print('preesd2');
    final response = await http.post('http://192.168.1.3/mutaman/login.php',
        body: {'name': username.text, 'password': password.text});
    print(jsonDecode(response.body));

    if (response.body.contains(username.text)) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Doctors()));
    }
  }*/
  }

  Future<List> login() async {
    final response = await http.post('http://192.168.1.3/API/login.php',
        body: {'name': name.text, 'password': password.text});
    print(response.body);

    if (response.body.contains(name.text)) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Doctors()));
    }
  }
}
