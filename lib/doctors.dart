import 'package:flutter/material.dart';
import 'package:mutaman/Network/doctordata.dart';
import 'package:mutaman/models/doctor.dart';

import 'color.dart';

class Doctors extends StatefulWidget {
  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kRed,
          title: Text('Doctor'),
        ),
        body: FutureBuilder(
            future: getdata(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Doctor> users = snapshot.data;
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.red,
                        child: Column(
                          children: <Widget>[
                            Text(
                              'id:${users[index].id}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'name:${users[index].name}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'date:${users[index].date}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
        /* SafeArea(
          child: ListView(
        children: <Widget>[
          ListTile(
            trailing: FlatButton(
              child: Icon(
                Icons.call,
                color: kRed,
              ),
              onPressed: () {
                print('');
              },
            ),
            leading: Icon(
              Icons.person,
              size: 50,
              color: kRed,
            ),
            title: Text("Dr Saif"),
            subtitle: Text("Skins"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DocInfo();
                  },
                ),
              );
            },
          ),
          ListTile(
            trailing: FlatButton(
              child: Icon(
                Icons.call,
                color: kRed,
              ),
              onPressed: () {
                print('');
              },
            ),
            leading: Icon(
              Icons.person,
              size: 50,
              color: kRed,
            ),
            title: Text("Dr Yousef"),
            subtitle: Text("Dentist"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DocInfo();
                  },
                ),
              );
            },
          ),
          ListTile(
            trailing: FlatButton(
              child: Icon(
                Icons.call,
                color: kRed,
              ),
              onPressed: () {
                print('');
              },
            ),
            leading: Icon(
              Icons.person,
              size: 50,
              color: kRed,
            ),
            title: Text("Dr Huda"),
            subtitle: Text("Bones"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DocInfo();
                  },
                ),
              );
            },
          ),
          Container(
            height: 500,
            child: ListView.builder(
                itemCount: map == null ? 0 : data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Text(data[index]['id']),
                  );
                }),
          ),
        ],
      )),*/
        );
  }
}
