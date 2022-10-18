import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/newsModel.dart';

import '../model/CountryModel.dart';

class SecondScreenProvider extends ChangeNotifier
{

  List <CountryModel> countrydetails = [
    CountryModel(name: "Argentina",image: "https://cdn.webshopapp.com/shops/94414/files/51865160/flag-of-argentina.jpg",code: "ar"),
    CountryModel(name: "Australia",image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Flag_of_Australia.svg/280px-Flag_of_Australia.svg.png",code: "au"),
    CountryModel(name: "Belgium",image: "https://www.worldatlas.com/r/w425/upload/95/0c/25/flag-of-belgium-1830-svg.png",code: "be"),
    CountryModel(name: "Brazil",image: "https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Flag_of_Brazil.svg/640px-Flag_of_Brazil.svg.png",code: "br"),
    CountryModel(name: "Canada",image: "https://www.worldatlas.com/img/flag/ca-flag.jpg",code: "ca"),
    CountryModel(name: "China",image: "https://cdn.britannica.com/90/7490-004-BAD4AA72/Flag-China.jpg",code: "cn"),
    CountryModel(name: "Colombia",image: "https://cdn.britannica.com/68/7668-004-08492AB7/Flag-Colombia.jpg",code: "co"),
    CountryModel(name: "Egypt",image: "https://cdn.britannica.com/85/185-004-1EA59040/Flag-Egypt.jpg",code: "eg"),
    CountryModel(name: "France",image: "https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Flag_of_France.svg/1200px-Flag_of_France.svg.png",code: "fr"),
    CountryModel(name: "Germany",image: "https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Flag_of_Germany.svg/1200px-Flag_of_Germany.svg.png",code: "de"),
    CountryModel(name: "Hong Kong",image: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Flag_of_Hong_Kong.svg/800px-Flag_of_Hong_Kong.svg.png",code: "hk"),
    CountryModel(name: "India",image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_India.png/800px-Flag_of_India.png",code: "in"),
    CountryModel(name: "Japan",image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Flag_of_Japan_%28with_border%29.png/640px-Flag_of_Japan_%28with_border%29.png",code: "jp"),
    CountryModel(name: "Norway",image: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Norway.svg/2560px-Flag_of_Norway.svg.png",code: "no"),
    CountryModel(name: "Russia",image: "https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Flag_of_Russia.svg/800px-Flag_of_Russia.svg.png",code: "ru"),
    CountryModel(name: "Singapore",image: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Flag_of_Singapore.svg/1200px-Flag_of_Singapore.svg.png",code: "sg"),
    CountryModel(name: "South Africa",image: "https://cdn.britannica.com/27/4227-004-32423B42/Flag-South-Africa.jpg",code: "za"),
    CountryModel(name: "Thailand",image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_Thailand.svg/255px-Flag_of_Thailand.svg.png",code: "th"),
    CountryModel(name: "UAE",image: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/255px-Flag_of_the_United_Arab_Emirates.svg.png",code: "ae"),
    CountryModel(name: "US",image: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png",code: "us"),
  ];


  CountryModel? namepicker;

  String country = "in";

  String countryname = "India";

  void changeCountry(String c1,String name)
  {
    country = c1;
    countryname = name;
    notifyListeners();
  }

  Future<NewsModel> newsapi(String data) async{

    String apilink = "https://newsapi.org/v2/top-headlines?country=$data&category=business&apiKey=3e71a8393c9e443dbd81f1c85ff621e6#";

    var jsonString = await http.get(Uri.parse(apilink));
    var json = jsonDecode(jsonString.body);

    return NewsModel.fromJson(json);
  }
}