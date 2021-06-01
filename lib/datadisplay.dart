import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myknot_application/main.dart';

import 'model/data.dart';
import 'model/data.dart';
class DataDisplay extends StatefulWidget {
  String url;
  DataDisplay({this.url});

  @override
  _DataDisplayState createState() => _DataDisplayState();
}

class _DataDisplayState extends State<DataDisplay> {
  var dataJson;

  model user;

  var name;
  var height;
  var weight;
  var belly, chest, wrist, armLength, thigh, shoulder, hips, ankle;

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
       //dataJson=json.decode(res.body);
       //var jsonseconddata;
     user = model.fromJson(jsonDecode(res.body));
      setState(() {
        name=user.d.neck;
        height=user.d.height;
        weight=user.d.weight;
        belly=user.d.belly;
        chest=user.d.chest;
        wrist=user.d.wrist;
        armLength=user.d.armLength;
        thigh=user.d.thigh;
        shoulder=user.d.shoulder;
        hips=user.d.hips;
        ankle=user.d.ankle;

      });

     // print(user.d.neck);


    }
  }


  @override
  void initState(){

    super.initState();

    print('inside init');

    createAlbum(widget.url).then((value){
      data.addAll(value);



    });
  }
  @override


  Widget build(BuildContext context) {

  print('inside build');

    return Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            RaisedButton(
              color: Colors.blue,

              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>MyApp()));


              },
              child: Text("Take Measurement Again",style:TextStyle(color:Colors.white)),

            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Text('Neck'),
                SizedBox(width: 190,),
                Text(name == null? 'Loading ..':name,style: TextStyle(fontWeight: FontWeight.bold),)
              ] ),

              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Text('Height'),
                      SizedBox(width: 190,),
                      Text(height == null? 'Loading ..':height,style: TextStyle(fontWeight: FontWeight.bold),)
                    ] ),

              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Text('Weight'),
                      SizedBox(width: 180,),
                      Text(weight == null? 'Loading ..':weight,style: TextStyle(fontWeight: FontWeight.bold),)
                    ] ),

              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Text('Belly'),
                      SizedBox(width: 190,),
                      Text(belly == null? 'Loading ..':belly,style: TextStyle(fontWeight: FontWeight.bold),)
                    ] ),

              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Text('Chest'),
                      SizedBox(width: 190,),
                      Text(chest == null? 'Loading ..':chest,style: TextStyle(fontWeight: FontWeight.bold),)
                    ] ),

              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Text('Wrist'),
                      SizedBox(width: 190,),
                      Text(wrist == null? 'Loading ..':wrist,style: TextStyle(fontWeight: FontWeight.bold),)
                    ] ),

              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Text('ArmLength'),
                      SizedBox(width: 160,),
                      Text(armLength == null? 'Loading ..':armLength,style: TextStyle(fontWeight: FontWeight.bold),)
                    ] ),

              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Text('Thigh'),
                      SizedBox(width: 190,),
                      Text(thigh == null? 'Loading ..':thigh,style: TextStyle(fontWeight: FontWeight.bold),)
                    ] ),

              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Text('Shoulder'),
                      SizedBox(width: 170,),
                      Text(shoulder== null? 'Loading ..':shoulder,style: TextStyle(fontWeight: FontWeight.bold),)
                    ] ),

              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Text('Hips'),
                      SizedBox(width: 190,),
                      Text(hips == null? 'Loading ..':hips,style: TextStyle(fontWeight: FontWeight.bold),)
                    ] ),

              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Text('Ankle'),
                      SizedBox(width: 190,),
                      Text(ankle == null? 'Loading ..':ankle,style: TextStyle(fontWeight: FontWeight.bold),)
                    ] ),

              ),
            ),
          ],
        ),
      )
    );

  }
}
