import 'package:first_application/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Applicarion",
      theme: ThemeData(
          primarySwatch: Colors.orange,
          buttonTheme: ButtonThemeData(buttonColor: Colors.blue)),
      home: HomePage(),
    );
  }
}
