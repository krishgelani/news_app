import 'package:flutter/material.dart';
import 'package:news_app/provider/homeProvider.dart';
import 'package:news_app/view/videoScreen.dart';
import 'package:provider/provider.dart';

import 'homeScreen.dart';

class navigationScreen extends StatefulWidget {
  const navigationScreen({Key? key}) : super(key: key);

  @override
  State<navigationScreen> createState() => _navigationScreenState();
}

class _navigationScreenState extends State<navigationScreen> {
  var Screen = [homeScreen(), VideoScreen()];

  // int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Screen[
            Provider.of<homeProvider>(context, listen: true).selectIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff363535),
          currentIndex: Provider.of<homeProvider>(context).selectIndex,
          onTap: (int index) {
            Provider.of<homeProvider>(context, listen: false)
                .selectindex(index);
          },
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle),
              label: "Video",
            ),
          ],
        ),
      ),
    );
  }
}