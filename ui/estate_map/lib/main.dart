import 'package:estate_map/views/show_map.dart';
import 'package:estate_map/views/add_coordinate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charity Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'All Task'),
      home: Row(
        children: [
          Container(width: 300, child: LoginView()),
          Flexible(child: ShowMap()),
        ],
      ),
    );
  }
}
