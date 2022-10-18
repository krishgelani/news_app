import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/CountryModel.dart';
import 'package:news_app/model/VideoModel.dart';
import 'package:news_app/model/newsModel.dart';

class homeProvider extends ChangeNotifier
{

  int selectIndex = 0;

  Articles? datapicker;

  var linkload;



  Future<NewsModel> newsteslaapi() async{

    String apilink = "https://newsapi.org/v2/everything?q=tesla&from=${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}&sortBy=publishedAt&apiKey=3e71a8393c9e443dbd81f1c85ff621e6";

    var jsonString = await http.get(Uri.parse(apilink));
    var json = jsonDecode(jsonString.body);

    return NewsModel.fromJson(json);
  }


  Future<VideoModel> videoapi() async{

    String videolink = "https://api.pexels.com/videos/search?query=nature&per_page=1";

    var jsonString = await http.get(Uri.parse(videolink),headers: {"Authorization":"563492ad6f917000010000019bc5beb9e70c47ab9b144307ffbca13a"});
    var json = jsonDecode(jsonString.body);

    linkload = json;
    print(linkload);

    return VideoModel.fromJson(json);
  }


  void selectindex(int i)
  {
    selectIndex = i;
    notifyListeners();
  }

  bool isplay = false;

  void playpause()
  {
    isplay =!isplay;
    notifyListeners();
  }

}