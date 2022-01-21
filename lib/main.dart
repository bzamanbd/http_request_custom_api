import 'package:flutter/material.dart';
import 'package:http_request_custom_api/screens/home_screen.dart';
void main()=>runApp(const MyApp());
class MyApp extends StatelessWidget {
  final String title='Custom API';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: HomeScreen(title: title),
      routes: {
        '/home-screen':(_)=>HomeScreen(title: title),
      },
    );
  }
}