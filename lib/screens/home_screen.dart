import 'package:flutter/material.dart';
import 'package:http_request_custom_api/screens/post_ui_screen.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const biggerFont = TextStyle(fontSize: 18.0);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_)=>const PostUiScreen())
            );
          }, 
          child: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10.0
            ),
            child: Text(
              'see posts', style: biggerFont,
            ),
          )
          ),
      ),
    );
  }
}