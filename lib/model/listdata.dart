import 'data.dart';

class ImageListModel{
  List<model> imgList;

  ImageListModel({this.imgList});

  ImageListModel.fromJson(List<dynamic> parsedJson){
    imgList=new List<model>();
    parsedJson.forEach((v){
      imgList.add(model.fromJson(v));
    });
  }
}