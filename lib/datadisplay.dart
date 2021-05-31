import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/data.dart';
class DataDisplay extends StatelessWidget {
  String url;
  DataDisplay({this.url});

  List<model> data=List<model>();
  Future<List<model>> createAlbum(String title) async{
    String imageUrl=title;
    var data=List<model>();
    http.Response res=await http.post(
      Uri.parse('https://backend-test-zypher.herokuapp.com/uploadImageforMeasurement'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'imageURL':imageUrl
      }),

    );
    if(res.statusCode==200)
    {
      print("heyyyyyyyyyyy");
      var dataJson=json.decode(res.body);
      for(var dJson in dataJson)
      {
        data.add(model.fromJson(dJson));
            print(data.length);

      }
    }
    //print("strinf len"+ data.length.toString());
    return data;



    //print(res.headers);
  }

  @override
  Widget build(BuildContext context) {

    createAlbum(url).then((value){
      data.addAll(value);
    });
    return Scaffold(
      body:ListView.builder(
          itemBuilder: (context,index){
            return Card(
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[index].d.toString()
                  ),
                  SizedBox(width: 40,),
                  //Text()
                ],
              )
            );
          })
    );
  }
}
