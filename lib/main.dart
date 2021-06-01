
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:image_picker/image_picker.dart';
import 'package:myknot_application/datadisplay.dart';

import 'model/data.dart';

Future<void> main() async {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( home:CameraWidget());
  }
}
class CameraWidget extends StatefulWidget{
  @override
  State createState() {
    // TODO: implement createState
    return CameraWidgetState();
  }

}

class CameraWidgetState extends State{

  PickedFile imageFile;
  String imageUrl;
  var data;


  Future<String> uploadImage(var imageFile ) async {
    Future <Response> DATA;
    Reference ref = FirebaseStorage.instance.ref().child("/photo.jpg");
    UploadTask uploadTask = ref.putFile(imageFile);

    uploadTask.whenComplete(() async{

      try {
        imageUrl = await ref.getDownloadURL();
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return DataDisplay(url:imageUrl);
        }));
      }
       // print(DATA.body["d"]["neck"]);

/*
 imageUrl = await ref.getDownloadURL();
          await createAlbum(imageUrl).then((value){
            DATA=value;
          });
 */

        //api call



      catch(onError){
      //  print("Error"+      onError.toString());
      }

      print(imageUrl);
      return imageUrl;

    });
  }


  Future _showChoiceDialog(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("Choose option",style: TextStyle(color: Colors.blue),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openGallery(context);
                },
                title: Text("Gallery"),
                leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openCamera(context);
                },
                title: Text("Camera"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    color:Colors.blueGrey,

                    child:( imageFile==null)?Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Select And Upload Image To FireBase",style:TextStyle(color:Colors.white,fontSize: 18)),
                    ): Image.file( File(  imageFile.path)),
                  ),
                  SizedBox(height: 20),
                  Row(
                      children:<Widget>[
                        SizedBox(width: 50,),
                        RaisedButton(

                          color: Colors.blue,
                          onPressed: (){
                            _showChoiceDialog(context);
                          },
                          child: Text("Select Image",style:TextStyle(color:Colors.white)),

                        ),
                        SizedBox(width: 20,),
                        RaisedButton(
                          color: Colors.blue,
                          onPressed: () {
                            uploadImage(File(imageFile.path));


                          },
                          child: Text("Upload Image",style:TextStyle(color:Colors.white)),

                        )
                      ] )
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }

  void _openGallery(BuildContext context) async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery ,
    );
    setState(() {
      imageFile = pickedFile;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context)  async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera ,
    );
    setState(() {
      imageFile = pickedFile;
    });
    Navigator.pop(context);
  }
}


