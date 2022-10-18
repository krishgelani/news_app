import 'package:flutter/material.dart';
import 'package:news_app/provider/SecondScreenProvider.dart';
import 'package:news_app/view/countryselectScreen.dart';
import 'package:news_app/view/detailScreen.dart';
import 'package:news_app/provider/homeProvider.dart';
import 'package:news_app/view/homeScreen.dart';
import 'package:news_app/view/navigationScreen.dart';
import 'package:news_app/view/secondScreen.dart';
import 'package:news_app/view/webview.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => homeProvider(),),
        ChangeNotifierProvider(create: (context) => SecondScreenProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => navigationScreen(),
          '/home':(context) => homeScreen(),
          '/secondScreen':(context) => SecondScreen(),
          '/detail':(context) => detailScreen(),
          '/web':(context) => webviewScreen(),
          '/country':(context) => cselectScreen(),
        },
      ),
    ),
  );
}