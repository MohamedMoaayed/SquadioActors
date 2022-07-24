import 'package:flutter/material.dart';
import 'package:squadio_PPL/presentation/screens/personsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Squadio People',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PersonsScreen(),
    );
  }
}
