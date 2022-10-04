import 'package:flutter/material.dart';
import 'package:kuis/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kuis 08",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          backgroundColor: Colors.black
      ),
      home: MainScreen(),
    );
  }
}
