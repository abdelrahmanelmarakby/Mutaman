import 'package:flutter/material.dart';
import 'package:mutaman/welcome.dart';

import 'welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  ThemeData theme = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,

      /* ThemeData().copyWith(
        scaffoldBackgroundColor: kWhite,
        primaryColor: kRed,
        cursorColor: kRed,
        hintColor: kRed,
      ),*/
      home: Welcome(),
    );
  }
}
