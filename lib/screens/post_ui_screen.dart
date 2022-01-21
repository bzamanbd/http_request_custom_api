import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class PostUiScreen extends StatefulWidget {
  const PostUiScreen({Key? key}) : super(key: key);

  @override
  _PostUiScreenState createState() => _PostUiScreenState();
}

class _PostUiScreenState extends State<PostUiScreen> {
  Future<List<Data>> getData() async {
    var response  =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var jsonData = jsonDecode(response.body);
    List<Data> dataList = [];
    for (var u in jsonData) {
      Data data = Data(u["title"], u["body"]);
      dataList.add(data);
    }
    // ignore: avoid_print
    print(dataList.length);
    return dataList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest Post'),
        centerTitle: true,
      ),
      body: Card(

        child: FutureBuilder<List<Data>>(
         future: getData(),
         builder: (context, snapshot) {
           if (snapshot.data == null) {
            return const Center(child: Text("Loading"));
        }else{
           return ListView.builder(
                 itemCount: snapshot.data!.length,
                 itemBuilder: (context, i) {
                   return ListTile(
                     visualDensity: const VisualDensity(
                       vertical: 4,
                       horizontal: 0.0
                       ),
                       title: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                             Text(snapshot.data![i].title,
                             style: TextStyle(fontSize: 18, 
                             color: Theme.of(context).primaryColor),),
                             Text(snapshot.data![i].body,
                             textAlign: TextAlign.justify,
                             ),
                       ],
                     ),
                   );
                });
            }
         },
        ),
      )
    );
  }
}
class Data {
  final String title, body;

  Data(this.title, this.body);
}
