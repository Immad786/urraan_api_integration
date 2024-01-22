import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'models/myposts.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  var client = Client();

  List<Myposts> myposts = [];
  @override
  void initState() {
    super.initState();

    LoadData();
  }

  void LoadData() async {
    String stringurl = "https://jsonplaceholder.typicode.com/posts/1/comments";
    Uri Uri_url = Uri.parse(stringurl);

    Response response = await client.get(Uri_url);

    if (response.statusCode == 200) {
      setState(() {
        myposts = mypostsFromMap(response.body);
      });
    }

    print("object");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(),

        body: Container(
          alignment: Alignment.center,
          child: myposts.length > 0 ? ListView.builder(

            itemCount: myposts.length,

            itemBuilder: (context, index) {
              return ListTile(

                title: Text("${myposts[index].body
                }"),); // ListTile

            },

          ) : CircularProgressIndicator(), // ListView.builder

        )); // Container, Scaffold

  }

}