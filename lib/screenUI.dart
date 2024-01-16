import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'MODEL/model_posts.dart';




class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  var client = http.Client();
  List welcome = [];
  @override

  void initState(){
    super.initState();
    loaddata();
  }

  Future<void> loaddata() async {
  String stringurl = "https://jsonplaceholder.typicode.com/posts";
  Uri uri_uri = Uri.parse(stringurl);

  client.get(uri_uri);

    http.Response response = await client.get(
        uri_uri,);
if(response.statusCode == 200)
  {
    setState(() {
      List welcome = welcomeFromMap(response.body);
    });

  }
    print("$response.statusCode");
    print("$response.body");

    // print("object");
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
//        child: const Text("Ayesha Sajid" ,style: TextStyle(fontSize: 52,color: Colors.amber),),
  child: welcome.length > 0 ? ListView.builder(
    itemCount: welcome.length,
    itemBuilder: (context, index){
      return ListTile(
        title: Text("$welcome[index].title"),
      );
    },
  ) : CircularProgressIndicator(),
      ),
    );
  }
}
