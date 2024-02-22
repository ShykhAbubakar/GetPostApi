import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getpostapi/Models/PostsModel.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PostsModel> postslist = [];

  Future<List<PostsModel>> getpostapi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for ( Map i in data ){
        postslist.add(PostsModel.fromJson(i));
      }
      return postslist;
    }
    else {
      return postslist;
    }


  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Get Post API', style: TextStyle(color: Colors.white),)),
      ),
      body: FutureBuilder(
          future: getpostapi(),
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return Text('Loading');
            } else {
              return ListView.builder(
                itemCount: postslist.length,
                  itemBuilder: (context, index){
                  return Text(index.toString());
                  }
              );
            }
          }
      )
    );
  }
}
